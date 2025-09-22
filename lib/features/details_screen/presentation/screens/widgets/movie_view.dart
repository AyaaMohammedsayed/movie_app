import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/app_theme.dart';
import 'package:movie_app/core/widgets/movie_item.dart';
import 'package:movie_app/l10n/app_localizations.dart';

class MovieView extends StatelessWidget {
  final String imgName;
  final String? movieName;
  final bool isImageNetwork;
  final double rating;
  final double width;
  final double height;
  final String year;
  final int likes;
  final int comments;

  const MovieView({
    super.key,
    required this.imgName,
    this.movieName,
    required this.rating,
    required this.height,
    required this.width,
    this.isImageNetwork = false,
    this.year = '',
    this.likes = 0,
    this.comments = 0,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        /// Movie Poster with overlay
        Stack(
          alignment: Alignment.center,
          children: [
            MovieItem(
              imgName: imgName,
              onTap: () {},
              height: height,
              width: width,
              isImageNetwork: true,
            ),
            Positioned(
              top: 16.h,
              left: 16.w,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_ios, color: AppTheme.white),
              ),
            ),

            Positioned(
              top: 16.h,
              right: 16.w,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.bookmark, color: AppTheme.white),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Image.asset(
                'assets/images/button_play.png',
                width: 97.w,
                height: 97.h,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppTheme.black.withValues(alpha: .2),
                      Colors.transparent,
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      movieName ?? '',
                      textAlign: TextAlign.center,
                      style: textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppTheme.white,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      year,
                      style: textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Color(0xffADADAD),
                      ),
                    ),
                    SizedBox(height: 8.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStat({required IconData icon, required String value}) {
    return Row(
      children: [
        Icon(icon, color: AppTheme.primary, size: 20),
        SizedBox(width: 4.w),
        Text(value, style: const TextStyle(color: AppTheme.white)),
      ],
    );
  }
}
