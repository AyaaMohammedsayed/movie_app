import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenShot extends StatelessWidget {
  const ScreenShot({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Image.asset('lib/features/details_screen/presentation/screens/widgets/test_screen.png',width: 398.w,height: 167.h,fit: BoxFit.fill,),
    );
  }
}
