import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;

  const CustomElevatedButton({required this.child, required this.onTap});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(screenWidth, screenHeight * 0.07),
      ),
      onPressed: onTap,
      child: child,
    );
  }
}
