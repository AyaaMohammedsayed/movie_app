import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/app_theme.dart';

class MovieItem extends StatelessWidget {
  final String imgName;
  final double rating;
  final bool isCategories;
  const MovieItem({
    super.key,
    required this.imgName,
    required this.rating,
    this.isCategories = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          imgName,
          width: isCategories ? 146.w : 234.w,
          height: isCategories ? 220.h : 351.h,
          fit: BoxFit.fill,
        ),
        Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: AppTheme.grey.withValues(alpha: 0.71),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                rating.toString(),
                style: Theme.of(
                  context,
                ).textTheme.titleMedium!.copyWith(color: AppTheme.white),
              ),
              Icon(Icons.star, color: AppTheme.primary),
            ],
          ),
        ),
      ],
    );
  }
}
