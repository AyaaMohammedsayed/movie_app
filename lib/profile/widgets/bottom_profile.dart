import 'package:flutter/material.dart';
import 'package:movie_app/shared/widgets/app_theme.dart';

class BottomProfile extends StatelessWidget {
  int imageName;
  bool isSelected;
  void Function() onTap;

  BottomProfile({
    required this.imageName,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: AppTheme.primary),
          borderRadius: BorderRadius.circular(20),
         
          color: isSelected ? AppTheme.primary : AppTheme.grey,
        ),
        child: Image.asset(
          'assets/images/avatar$imageName.png',
          width: 86,
          height: 86,
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}
