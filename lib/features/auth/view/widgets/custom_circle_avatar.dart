import 'package:flutter/material.dart';
import 'package:movie_app/core/app_theme.dart';

class CustomCircleAvatar extends StatefulWidget {
  final String iconName;
  final VoidCallback onTap;
  final bool tappedValue;

  const CustomCircleAvatar({
    required this.iconName,
    required this.tappedValue,
    required this.onTap,
    super.key,
  });

  @override
  State<CustomCircleAvatar> createState() => _CustomCircleAvatarState();
}

class _CustomCircleAvatarState extends State<CustomCircleAvatar> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: CircleAvatar(
        backgroundColor: AppTheme.primary,
        radius: widget.tappedValue == true ? 18 : 15,
        child: CircleAvatar(
          radius: 15,
          backgroundImage: AssetImage(widget.iconName),
        ),
      ),
    );
  }
}
