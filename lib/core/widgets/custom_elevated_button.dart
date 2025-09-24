import 'package:flutter/material.dart';
import 'package:movie_app/core/app_theme.dart';

class CustomElevatedButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final bool hasBorder;
  final double? screenWidth;

  const CustomElevatedButton({
    super.key,
    required this.child,
    required this.onTap,
    this.backgroundColor,
    this.foregroundColor,
    this.hasBorder = false,
    this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double _screenWidth = MediaQuery.sizeOf(context).width;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize:
            screenWidth == null
                ? Size(_screenWidth, screenHeight * 0.07)
                : Size(screenWidth!, screenHeight * 0.07),
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
