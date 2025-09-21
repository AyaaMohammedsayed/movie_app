import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/app_theme.dart';
import 'package:movie_app/core/constants/constants.dart';
import 'package:movie_app/core/widgets/custom_elevated_button.dart';
import 'package:movie_app/core/widgets/loading_indicator.dart';
import 'package:movie_app/core/widgets/movie_item.dart';
import 'package:movie_app/features/details_screen/presentation/cubit/details_cubit.dart';
import 'package:movie_app/features/details_screen/presentation/cubit/movie_datails_states.dart';
import 'package:movie_app/features/details_screen/presentation/screens/widgets/cast.dart';
import 'package:movie_app/features/details_screen/presentation/screens/widgets/geners.dart';
import 'package:movie_app/features/details_screen/presentation/screens/widgets/movie_details_review.dart';
import 'package:movie_app/features/details_screen/presentation/screens/widgets/movie_view.dart';
import 'package:movie_app/features/details_screen/presentation/screens/widgets/screen_shot.dart';
import 'package:movie_app/features/details_screen/presentation/screens/widgets/section.dart';
import 'package:movie_app/l10n/app_localizations.dart';
import 'package:readmore/readmore.dart';

class MoveDetails extends StatefulWidget {
  static const String routeName = '/movie_details_screen';

  const MoveDetails({super.key});

  @override
  State<MoveDetails> createState() => _MoveDetailsState();
}

class _MoveDetailsState extends State<MoveDetails> {
  late DetailsCubit _detailsCubit;
  bool _isInitialized = false;

  @override
  void didChangeDependencies() {
    if (!_isInitialized) {
      final int movieId = ModalRoute.of(context)!.settings.arguments as int;
      _detailsCubit = DetailsCubit(movieId.toString());
      _isInitialized = true;
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _detailsCubit.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final appLocalizations = AppLocalizations.of(context)!;

    return Scaffold(
      body: BlocProvider.value(
        value: _detailsCubit,
        child: BlocBuilder<DetailsCubit, MovieDetailsState>(
          builder: (context, state) {
            if (state is MovieDetailsLoading || state is MovieDetailsInit) {
              return LoadingIndicator();
            } else if (state is MovieDetailsError) {
              return Center(
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
            } else if (state is MovieDetailsSuccess) {
              final movie = state.dData.movie!;
              final suggestionsList = state.suggestions;
              return ListView(
                padding: EdgeInsets.zero,
                children: [
                  MovieView(
                    imgName: movie.largeCoverImage!,
                    movieName: movie.title,
                    year: '${movie.year}',
                    rating: movie.rating!.toDouble(),
                    width: double.infinity,
                    height: 645.h,
                    isImageNetwork: false,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: CustomElevatedButton(
                      onTap: () {},
                      backgroundColor: AppTheme.red,
                      foregroundColor: AppTheme.white,
                      child: Text(appLocalizations.watch),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: MovieDetailsReview(
                      love: movie.likeCount!,
                      stars: movie.rating!,
                      time: movie.runtime!,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Section(
                    title: appLocalizations.screenShots,
                    children: [
                      ScreenShot(imageNameURL: movie.largeScreenshotImage1!),
                      SizedBox(height: 16.h),
                      ScreenShot(imageNameURL: movie.largeScreenshotImage2!),
                      SizedBox(height: 16.h),
                      ScreenShot(imageNameURL: movie.largeScreenshotImage3!),
                    ],
                  ),
                  Section(
                    title: appLocalizations.similar,
                    children: [
                      GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 189.w / 279.h,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 8,
                        ),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: suggestionsList.length,
                        itemBuilder:
                            (_, index) => MovieItem(
                              imgName:
                                  suggestionsList[index].mediumCoverImage ??
                                  AppImages.placeholderErrorImage,
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  MoveDetails.routeName,
                                  arguments: suggestionsList[index].id,
                                );
                              },
                              rating: suggestionsList[index].rating,
                              height: 279.h,
                              width: 189.w,
                              isImageNetwork: true,
                            ),
                      ),
                    ],
                  ),

                  Section(
                    title: appLocalizations.summary,
                    children: [
                      ReadMoreText(
                        movie.descriptionIntro!.isEmpty
                            ? 'No Description'
                            : movie.descriptionIntro!,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                        ),
                        trimMode: TrimMode.Length,
                        trimLines: 7,
                        colorClickableText: AppTheme.primary,
                      ),
                    ],
                  ),
                  Section(
                    title: appLocalizations.cast,
                    children: [
                      ListView.separated(
                        itemBuilder:
                            (_, index) => CastingDetails(
                              name: movie.cast![index].name!,
                              character: movie.cast![index].characterName!,
                              imageURL:
                                  movie.cast![index].urlSmallImage ??
                                  AppImages.placeholderErrorImage,
                            ),
                        separatorBuilder: (_, __) => SizedBox(height: 13.h),
                        itemCount: 3,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                      ),
                    ],
                  ),

                  Section(
                    title: appLocalizations.genres,
                    children: [
                      GridView.builder(
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 130.w,
                          mainAxisSpacing: 11.h,
                          crossAxisSpacing: 16.w,
                          childAspectRatio: 3,
                        ),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: movie.genres!.length,
                        itemBuilder:
                            (_, index) =>
                                Geners(catgoryId: movie.genres![index]),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                ],
              );
            } else {
              return Container(color: AppTheme.primary);
            }
          },
        ),
      ),
    );
  }
}
