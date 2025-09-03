import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;
  Color? color;
  Color? foregroundColor;

  CustomElevatedButton({required this.child, required this.onTap, this.color,this.foregroundColor});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(screenWidth, screenHeight * 0.07),
        backgroundColor: color,
        foregroundColor: foregroundColor,
      ),
      onPressed: onTap,
      child: child,
    );
  }
}
