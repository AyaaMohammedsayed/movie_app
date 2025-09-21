import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/app_theme.dart';
import 'package:movie_app/core/constants/constants.dart';
import 'package:movie_app/core/widgets/movie_item.dart';
import 'package:movie_app/l10n/app_localizations.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    final appLocalizations = AppLocalizations.of(context)!;
    return Column(
      children: [
        Stack(
          children: [
            MovieItem(
              imgName: AppImages.movieImages[currentIndex],
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
                      fit: BoxFit.fill,
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
                    autoPlayInterval: Duration(seconds: 10),
                    autoPlayAnimationDuration: Duration(seconds: 3),
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
                  itemCount: AppImages.movieImages.length,
                  itemBuilder: (_, index, _) {
                    return MovieItem(
                      imgName: AppImages.movieImages[index],
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
                      fit: BoxFit.fill,
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
                    Text(appLocalizations.action, style: textTheme.titleLarge),
                    Spacer(),
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
                  itemCount: AppImages.movieImages.length,
                  separatorBuilder: (_, _) => SizedBox(width: 16.w),
                  itemBuilder:
                      (_, index) => MovieItem(
                        imgName: AppImages.movieImages[index],
                        rating: 7.7,
                        width: 146.w,
                        height: 220.h,
                      ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
