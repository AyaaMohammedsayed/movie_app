import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/widgets/movie_item.dart';

class ScreenShot extends StatelessWidget {
  final String imageNameURL;
  const ScreenShot({super.key, required this.imageNameURL});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(16),
      child: MovieItem(
        imgName: imageNameURL,
        isImageNetwork: true,
        onTap: () {},
        height: 167.h,
        width: 1.sw,
      ),
    );
  }
}
