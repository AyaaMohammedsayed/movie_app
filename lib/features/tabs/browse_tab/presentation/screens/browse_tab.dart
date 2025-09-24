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
import 'package:movie_app/features/tabs/browse_tab/presentation/widgets/tab_item.dart';

class BrowseTab extends StatefulWidget {
  const BrowseTab({super.key});

  @override
  State<BrowseTab> createState() => _BrowseTabState();
}

class _BrowseTabState extends State<BrowseTab> with TickerProviderStateMixin {
  late TabController _tabController;
  String selectedCategoryId = 'Drama';
  @override
  void initState() {
    super.initState();
    context.read<BrowseCubit>().getGenresAndMovies();
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
          final categories = state.categories;
          _tabController = TabController(
            length: categories.length,
            vsync: this,
          );
          _tabController.addListener(() {
            if (_tabController.indexIsChanging) return;
            context.read<BrowseCubit>().getMoviesForCategory(
              categories[_tabController.index].id,
            );
          });
          return Padding(
            padding: const EdgeInsets.only(left: 5, right: 5, top: 16),
            child: Column(
              children: [
                if (categories.isNotEmpty)
                  SizedBox(
                    height: 70.h,
                    child: TabBar(
                      controller: _tabController,
                      tabAlignment: TabAlignment.start,
                      isScrollable: true,
                      dividerColor: Colors.transparent,
                      indicatorColor: Colors.transparent,
                      labelPadding: const EdgeInsets.only(right: 10, left: 0),
                      onTap: (index) {
                        setState(() {
                          selectedCategoryId = categories[index].id;
                        });
                        context.read<BrowseCubit>().getMoviesForCategory(
                          categories[index].id,
                        );
                        _tabController.animateTo(index);
                      },
                      tabs:
                          categories.map((element) {
                            return TabItem(
                              title: element.name,
                              isSelected: element.id == state.categoryId,
                              selectedBackgroundColorItem: AppTheme.primary,
                              selectedForgroundColorItem: AppTheme.black,
                              unSelectedForgroundColorItem: AppTheme.primary,
                            );
                          }).toList(),
                    ),
                  ),

                const SizedBox(height: 12),

                Expanded(
                  child: NotificationListener<ScrollNotification>(
                    onNotification: (ScrollNotification scrollInfo) {
                      if (scrollInfo.metrics.pixels >=
                          scrollInfo.metrics.maxScrollExtent - 200) {
                        context.read<BrowseCubit>().loadMoreMoviesForCategory();
                      }
                      return true;
                    },
                    child: GridView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 16.h),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 189.w / 279.h,
                        crossAxisSpacing: 20.w,
                        mainAxisSpacing: 8.h,
                      ),
                      itemCount:
                          state.moviesList.length +
                          (state.isPaginating ? 1 : 0),
                      itemBuilder: (_, index) {
                        if (index == state.moviesList.length &&
                            state.isPaginating) {
                          return const Center(child: LoadingIndicator());
                        }
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
