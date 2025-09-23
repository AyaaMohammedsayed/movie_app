import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/app_theme.dart';
import 'package:movie_app/core/constants/constants.dart';
import 'package:movie_app/core/widgets/loading_indicator.dart';
import 'package:movie_app/core/widgets/movie_item.dart';
import 'package:movie_app/features/details_screen/presentation/screens/view/movie_details_screen.dart';
import 'package:movie_app/features/tabs/browse_tab/presentation/cubit/browse_cubit.dart';
import 'package:movie_app/features/tabs/browse_tab/presentation/cubit/browse_state.dart';
import 'package:movie_app/features/tabs/browse_tab/presentation/widgets/movie_category.dart';
import 'package:movie_app/features/tabs/browse_tab/presentation/widgets/tab_item.dart';

class BrowseTab extends StatefulWidget {
  const BrowseTab({super.key});

  @override
  State<BrowseTab> createState() => _BrowseTabState();
}

class _BrowseTabState extends State<BrowseTab> with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    context.read<BrowseCubit>().getGenresAndMovies();
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrowseCubit, BrowseState>(
      builder: (context, state) {
        if (state is BrowseLoading) {
          return const Center(child: LoadingIndicator());
        } else if (state is BrowseError) {
          return Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(AppImages.emptyImage),
                Text(
                  state.message,
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge!.copyWith(color: AppTheme.primary),
                ),
              ],
            ),
          );
        } else if (state is BrowseSuccess) {
          final List<MovieCategory> categories = state.categories;

          if (_tabController == null ||
              _tabController!.length != categories.length) {
            _tabController = TabController(
              length: categories.length,
              vsync: this,
            );
          }

          final currentIndex = categories.indexWhere(
            (cat) => cat.id == state.categoryId,
          );
          if (currentIndex != -1 && _tabController!.index != currentIndex) {
            _tabController!.animateTo(currentIndex);
          }

          return Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Column(
              children: [
                if (categories.isNotEmpty)
                  TabBar(
                    controller: _tabController,
                    onTap: (index) {
                      context.read<BrowseCubit>().getMoviesForCategory(
                        categories[index].id,
                      );
                    },
                    tabAlignment: TabAlignment.start,
                    isScrollable: true,
                    dividerColor: Colors.transparent,
                    indicatorColor: Colors.transparent,
                    labelPadding: const EdgeInsets.only(right: 10, left: 0),
                    tabs:
                        categories
                            .map(
                              (element) => TabItem(
                                title: element.name,
                                isSelected: element.isSelected,
                                selectedBackgroundColorItem: AppTheme.primary,
                                selectedForgroundColorItem: AppTheme.black,
                                unSelectedForgroundColorItem: AppTheme.primary,
                                onTap: () {
                                  context
                                      .read<BrowseCubit>()
                                      .getMoviesForCategory(element.id);
                                },
                              ),
                            )
                            .toList(),
                  ),

                const SizedBox(height: 12),

                Expanded(
                  child: GridView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 16.h),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 189.w / 279.h,
                      crossAxisSpacing: 20.w,
                      mainAxisSpacing: 8.h,
                    ),
                    itemCount: state.moviesList.length,
                    itemBuilder: (_, index) {
                      final movie = state.moviesList[index];
                      return MovieItem(
                        imgName:
                            movie.largeCoverImage ??
                            AppImages.placeholderErrorImage,
                        rating: movie.rating ?? 0.0,
                        movieName: movie.title,
                        isImageNetwork: true,
                        height: 279.h,
                        width: 191.w,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            MoveDetails.routeName,
                            arguments: movie.id,
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Center(child: Text('No movies found.'));
        }
      },
    );
  }
}
