import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavBarIcon extends StatelessWidget {
  final String imageName;
  const NavBarIcon({required this.imageName, super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(imageName, height: 24, width: 24, fit: BoxFit.fill);
  }
}
