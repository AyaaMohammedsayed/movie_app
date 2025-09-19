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
        controller: _controller,
        itemCount: OnboardingService.onboardingList.length,
        itemBuilder:
            (_, int index) => OnboardingItem(
              index: index,
              onDecrement: () => pageIndex--,
              onIncrement: () => pageIndex++,
            ),
        onPageChanged: (index) {
          setState(() {
            pageIndex = index;
          });
        },
      ),
    );
  }
}
<<<<<<< HEAD
=======


/*
 Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      if (pageIndex >= 1) {
                        _controller.animateToPage(
                          pageIndex - 1,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        );
                        print(pageIndex);
                      }
                    },
                    icon: Icon(Icons.arrow_back_outlined, size: 24),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      DotIndicator(isActive: pageIndex == 0),
                      DotIndicator(isActive: pageIndex == 1),
                      DotIndicator(isActive: pageIndex == 2),
                    ],
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      if (pageIndex <= 1) {
                        _controller.animateToPage(
                          pageIndex + 1,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.linear,
                        );
                        print(pageIndex);
                      }
                      if (pageIndex == 2) {
                        Navigator.pushNamed(context, LoginScreen.routName);
                        OnboardingService.onboardingComplete();
                      }
                    },
                    icon: Icon(Icons.arrow_forward_outlined, size: 24),
                  ),
                ],
              ),
            ),
        

 */
>>>>>>> dfa1a2cf930ac7fe0d933099c765bbde5b28cd78
