import 'package:flutter/material.dart';
import 'package:movie_app/features/auth/presentation/screens/login_screen.dart';
import 'package:movie_app/features/onboarding/view/widgtes/onboarding_background.dart';
import 'package:movie_app/features/onboarding/view/widgtes/onboarding_foreground.dart';
import 'package:movie_app/features/onboarding/data/data_source/local/onboarding_service.dart';

class OnboardingItem extends StatefulWidget {
  final int index;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  const OnboardingItem({
    super.key,
    required this.index,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  State<OnboardingItem> createState() => _OnboardingItemState();
}

class _OnboardingItemState extends State<OnboardingItem> {
  late int currentIndex = widget.index;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        OnboardingBackground(index: currentIndex),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: OnboardingForeground(
            index: currentIndex,
            onIncrement: () {
              if (currentIndex > 4) {
                Navigator.of(
                  context,
                ).pushReplacementNamed(LoginScreen.routeName);
                OnboardingService.onboardingComplete();
                return;
              }
              setState(() => currentIndex++);
            },
            onDecrement: () {
              setState(() => currentIndex--);
            },
          ),
        ),
      ],
    );
  }
}
