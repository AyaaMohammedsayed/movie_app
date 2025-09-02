import 'package:flutter/material.dart';
import 'package:movie_app/shared/widgets/app_theme.dart';

class DefaultElevatedButton extends StatelessWidget {
  String lable;
  VoidCallback onPressed;
  Color color;

  DefaultElevatedButton({
    required this.lable,
    required this.onPressed,
    this.color = AppTheme.yellow,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(MediaQuery.sizeOf(context).width, 56),
      ),
      child: Text(
        lable,
        style: Theme.of(
          context,
        ).textTheme.titleMedium!.copyWith(color: AppTheme.black),
      ),
    );
  }
}
