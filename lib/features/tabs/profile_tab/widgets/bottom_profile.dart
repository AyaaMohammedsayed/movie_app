import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/app_theme.dart';

class BottomProfile extends StatelessWidget {
  final int imageName;
  final bool isSelected;
  final void Function() onTap;

  const BottomProfile({
    super.key,
    required this.imageName,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(10.r),
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(
          border: Border.all(color: AppTheme.primary),
          borderRadius: BorderRadius.circular(20.r),

          color: isSelected ? AppTheme.primary : AppTheme.grey,
        ),
        child: Image.asset(
          'assets/images/avatar$imageName.png',
          width: 86.w,
          height: 86.h,
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}
