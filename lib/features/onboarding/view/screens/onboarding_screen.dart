import 'package:flutter/material.dart';

import 'package:movie_app/features/onboarding/data/data_source/local/onboarding_service.dart';
import 'package:movie_app/features/onboarding/view/widgtes/onboarding_item.dart';

class OnboardingScreen extends StatefulWidget {
  static const String routeName = '/onboarding_screen';

  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: _controller,
        itemCount: OnboardingService.onboardingList.length,
        itemBuilder: (_, int index) => OnboardingItem(index: index),
      ),
    );
  }
}
