import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/app_theme.dart';
import 'package:movie_app/core/widgets/movie_item.dart';
import 'package:movie_app/features/onboarding/data/model/onboarding_model.dart';
import 'package:movie_app/features/onboarding/data/data_source/local/onboarding_service.dart';

class OnboardingBackground extends StatelessWidget {
  final int index;
  const OnboardingBackground({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    List<OnboardingModel> itemsList = OnboardingService.onboardingList;

    return MovieItem(
      imgName: 'assets/images/onBoarding_${itemsList[index].imgName}.png',
      width: 1.sw,
      height: 1.sh,
      withGradient: true,
      stopsBTT: [0, 1],
      gradientColors: [
        AppTheme.blackSecondary.withValues(alpha: 1),
        AppTheme.blackSecondary.withValues(alpha: 0),
      ],
    );
  }
}
