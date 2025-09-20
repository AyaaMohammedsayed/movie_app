import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/app_theme.dart';
import 'package:movie_app/core/constants/constants.dart';
import 'package:movie_app/core/widgets/custom_text_form_field.dart';
import 'package:movie_app/core/widgets/loading_indicator.dart';
import 'package:movie_app/core/widgets/movie_item.dart';
import 'package:movie_app/features/details_screen/presentation/screens/view/movie_details_screen.dart';
import 'package:movie_app/features/tabs/search_tab/presentation/cubit/search_cubit.dart';
import 'package:movie_app/features/tabs/search_tab/presentation/cubit/search_state.dart';
import 'package:movie_app/l10n/app_localizations.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 12.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.h).copyWith(top: 21.h),
          child: CustomTextFormField(
            controller: controller,
            hintText: AppLocalizations.of(context)!.search,
            prefixIconName: AppImages.unSelectedNavBarIcons[1],
            onSubmitted: (value) {
              context.read<SearchCubit>().search(value);
            },
          ),
        ),
        SizedBox(height: 12.h),
        BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            if (state is SearchLoading) {
              return const Expanded(child: LoadingIndicator());
            } else if (state is SearchError) {
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
            } else if (state is SearchSuccess) {
              if (state.moviesList.isEmpty) {
                return Expanded(
                  child: Center(child: Image.asset(AppImages.emptyImage)),
                );
              }

              return Expanded(
                child: NotificationListener<ScrollNotification>(
                  onNotification: (ScrollNotification scrollInfo) {
                    if (scrollInfo.metrics.pixels >=
                        scrollInfo.metrics.maxScrollExtent - 200) {
                      context.read<SearchCubit>().loadMoreMovies(
                        controller.text,
                      );
                    }
                    return true;
                  },
                  child: GridView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 16.h),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 16.w,
                      mainAxisSpacing: 8.h,
                      childAspectRatio: 191 / 279,
                      crossAxisCount: 2,
                    ),
                    itemCount:
                        state.moviesList.length +
                        (context.read<SearchCubit>().hasMore ? 1 : 0),
                    itemBuilder: (_, index) {
                      if (index == state.moviesList.length) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: AppTheme.primary,
                          ),
                        );
                      }
                      return MovieItem(
                        imgName: state.moviesList[index].largeCoverImage!,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            MoveDetails.routeName,
                            arguments: state.moviesList[index].id,
                          );
                          print(state.moviesList[index].id);
                        },
                        rating: state.moviesList[index].rating!,
                        movieName: state.moviesList[index].title,
                        width: 191.h,
                        height: 279.h,
                        isImageNetwork: true,
                      );
                    },
                  ),
                ),
              );
            } else {
              return const Expanded(child: SizedBox());
            }
          },
        ),
      ],
    );
  }
}
