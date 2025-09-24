import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/app_theme.dart';
import 'package:movie_app/core/constants/constants.dart';
import 'package:movie_app/core/widgets/movie_item.dart';
import 'package:movie_app/features/details_screen/presentation/screens/view/movie_details_screen.dart';
import 'package:movie_app/features/tabs/home_tab/presentation/cubit/movie_cubit.dart';
import 'package:movie_app/features/tabs/home_tab/presentation/cubit/states.dart';
import 'package:movie_app/l10n/app_localizations.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    context.read<MovieCubit>().getMovieList();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    final appLocalizations = AppLocalizations.of(context)!;

    return BlocBuilder<MovieCubit, MovieState>(
      builder: (context, state) {
        if (state is GetMovieLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetMovieError) {
          return Center(child: Text(state.message));
        }

        List movies =
            state is GetMovieSuccess
                ? state.getMovieResponse.data?.movies ?? []
                : [];

                 movies = movies.toList()..sort((a, b) => b.year!.compareTo(a.year!));
          final selectedCategory= context.watch<MovieCubit>().selectedCategory;
 
        return Column(
          children: [
            Stack(
              children: [
                MovieItem(
                  imgName:
                      movies.isNotEmpty
                          ? movies[currentIndex].largeCoverImage ??
                              AppImages.movieImages[0]
                          : AppImages.movieImages[0],
                  isImageNetwork: true,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      MoveDetails.routeName,
                      arguments: movies[currentIndex].id,
                    );
                  },
                  height: 645.h,
                  width: 1.sw,
                  withGradient: true,
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 7.h),
                      child: Center(
                        child: Image.asset(
                          AppImages.availableNow,
                          width: 267.w,
                          height: 93.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    CarouselSlider.builder(
                      options: CarouselOptions(
                        height: 351.h,
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.6,
                        initialPage: currentIndex,
                        enableInfiniteScroll: true,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 10),
                        autoPlayAnimationDuration: const Duration(seconds: 3),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.3,
                        onPageChanged: (index, _) {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                        scrollDirection: Axis.horizontal,
                      ),
                      itemCount:
                          movies.isNotEmpty
                              ? movies.length
                              : AppImages.movieImages.length,
                      itemBuilder: (_, index, _) {
                        final movieImage =
                            movies.isNotEmpty
                                ? movies[index].largeCoverImage ??
                                    AppImages.movieImages[index]
                                : AppImages.movieImages[index];

                        return MovieItem(
                          imgName: movieImage,
                          isImageNetwork: true,
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              MoveDetails.routeName,
                              arguments: movies[currentIndex].id,
                            );
                          },
                          rating: 7.7,
                          width: 234.w,
                          height: 351.h,
                        );
                      },
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 30.h),
                        child: Image.asset(
                          AppImages.watchNow,
                          width: 354.w,
                          height: 146.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: [
                        Text(selectedCategory,style: textTheme.titleLarge),
                        const Spacer(),
                        Text(
                          appLocalizations.seeMore,
                          style: textTheme.titleMedium!.copyWith(
                            decoration: TextDecoration.underline,
                            decorationColor: AppTheme.primary,
                            decorationThickness: 2,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          size: 15,
                          color: AppTheme.primary,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount:
                          movies.isNotEmpty
                              ? movies
                                  .where(
                                    (movie) =>
                                        movie.genres != null &&
                                        movie.genres!.contains(
                                          context
                                              .watch<MovieCubit>()
                                              .selectedCategory,
                                        ),
                                  )
                                  .length
                              : AppImages.movieImages.length,
                      separatorBuilder: (_, _) => SizedBox(width: 16.w),
                      itemBuilder: (_, index) {
                        final filteredMovies =
                            movies.isNotEmpty
                                ? movies
                                    .where(
                                      (movie) =>
                                          movie.genres != null &&
                                          movie.genres!.contains(
                                 selectedCategory
                                          ),
                                    )
                                    .toList()
                                : [];

                        final movieImage =
                            filteredMovies.isNotEmpty
                                ? filteredMovies[index].largeCoverImage ??
                                    AppImages.movieImages[index]
                                : AppImages.movieImages[index];

                        return MovieItem(
                          imgName: movieImage,
                          isImageNetwork: true,
                          onTap: () {
                            if (filteredMovies.isNotEmpty) {
                              Navigator.pushNamed(
                                context,
                                MoveDetails.routeName,
                                arguments: filteredMovies[index].id,
                              );
                            }
                          },
                          rating: 7.7,
                          width: 146.w,
                          height: 220.h,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
