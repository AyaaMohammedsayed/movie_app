import 'package:flutter/material.dart';
import 'package:movie_app/core/app_theme.dart';

class CustomElevatedButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final bool hasBorder;

  const CustomElevatedButton({
    super.key,
    required this.child,
    required this.onTap,
    this.backgroundColor,
    this.foregroundColor,
    this.hasBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(screenWidth, screenHeight * 0.07),
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side:
              hasBorder
                  ? BorderSide(
                    color: foregroundColor ?? AppTheme.primary,
                    width: 2,
                  )
                  : BorderSide.none,
        ),
      ),
      onPressed: onTap,
      child: child,
    );
  }
}
