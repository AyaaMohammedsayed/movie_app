import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/app_theme.dart';

class Geners extends StatelessWidget {
  final String catgoryId;
  const Geners({required this.catgoryId, super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: AppTheme.grey,
      ),
      child: Text(
        catgoryId,
        style: textTheme.titleMedium?.copyWith(color: AppTheme.white),
        textAlign: TextAlign.center,

      ),
    );
  }
}
