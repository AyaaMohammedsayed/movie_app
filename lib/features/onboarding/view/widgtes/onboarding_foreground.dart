import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/app_theme.dart';
import 'package:movie_app/core/widgets/custom_elevated_button.dart';
import 'package:movie_app/features/onboarding/data/model/onboarding_model.dart';
import 'package:movie_app/features/onboarding/data/data_source/local/onboarding_service.dart';

class OnboardingForeground extends StatefulWidget {
  final int index;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  const OnboardingForeground({
    super.key,
    required this.onIncrement,
    required this.onDecrement,
    required this.index,
  });

  @override
  State<OnboardingForeground> createState() => _OnboardingForegroundState();
}

class _OnboardingForegroundState extends State<OnboardingForeground> {
  @override
  Widget build(BuildContext context) {
    List<OnboardingModel> itemsList = OnboardingService.onboardingList;
    bool isFirst = itemsList[widget.index] == itemsList.first;

    return Container(
      decoration: BoxDecoration(
        color: isFirst ? Colors.transparent : AppTheme.black,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.r),
          topRight: Radius.circular(40.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              itemsList[widget.index].title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: 8.h),
            Text(
              itemsList[widget.index].description,
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 16.h),
            CustomElevatedButton(
              child: Text(
                isFirst
                    ? 'Explore Now'
                    : itemsList[widget.index] == itemsList.last
                    ? 'Finish'
                    : 'Next',
              ),
              onTap: () => widget.onIncrement(),
            ),
            SizedBox(height: 16.h),
            isFirst || itemsList[widget.index] == itemsList[1]
                ? Container()
                : CustomElevatedButton(
                  onTap: () => widget.onDecrement(),
                  foregroundColor: AppTheme.primary,
                  backgroundColor: AppTheme.black,
                  hasBorder: true,
                  child: Text('Back'),
                ),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }
}
