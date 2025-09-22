import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/app_theme.dart';
import 'package:movie_app/core/widgets/movie_item.dart';

class CastingDetails extends StatelessWidget {
  final String name;
  final String character;
  final String imageURL;

  const CastingDetails({
    required this.character,
    required this.name,
    required this.imageURL,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(11.w),
      decoration: BoxDecoration(
        color: AppTheme.grey,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 40,
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(40),
              child: MovieItem(
                imgName: imageURL,
                isImageNetwork: true,
                onTap: () {},
                height: 90.h,
                width: 100.w,
              ),
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name : $name',
                  style: textTheme.titleLarge,
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 6.h),
                Text(
                  'Character : $character',
                  style: textTheme.titleLarge,
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
