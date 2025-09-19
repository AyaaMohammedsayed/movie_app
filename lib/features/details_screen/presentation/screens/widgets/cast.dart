import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/app_theme.dart';

class CastingDetails extends StatelessWidget {
  final String name;
  final String character;

  const CastingDetails({
    required this.character,
    required this.name,
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
        crossAxisAlignment:
            CrossAxisAlignment.start, 
        children: [
          ClipRRect(
            //  borderRadius: BorderRadius.circular(35.r),
            child: Image.asset(
              "lib/features/details_screen/presentation/screens/widgets/cast.png",
              height: 70.h,
              width: 70.h,
              fit: BoxFit.cover,
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
                  maxLines: null, 
                ),
                SizedBox(height: 6.h),
                Text(
                  'Character : $character',
                  style: textTheme.titleLarge,
                  softWrap: true,
                  maxLines: null,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
