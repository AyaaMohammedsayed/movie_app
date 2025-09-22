import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/core/app_theme.dart';

class DetailsItem extends StatelessWidget {
  String imageName;
  String data;
  bool isSelected;
  DetailsItem({
    super.key,
    required this.data,
    required this.imageName,
    this.isSelected = true,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.34.w,

      padding: EdgeInsets.symmetric(vertical: 9),
      decoration: BoxDecoration(
        color: AppTheme.grey,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/icons/$imageName.svg'),
          SizedBox(width: 9),
          Text(data, style: textTheme.headlineSmall),
        ],
      ),
    );
  }
}
