import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final double size;
  final double iconSize;

  AppIcon({super.key,
  required this.icon,
  this.backgroundColor=const Color(0xFFfcf4e4),
  this.iconColor=const Color(0xFF756d54),
  this.size=40,
  this.iconSize=16,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.responsiveWidth(size),
      height: Dimensions.responsiveHeight(size),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.responsiveHeight(20)),
        color: backgroundColor
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: Dimensions.responsiveHeight(iconSize),
      ),
    );
  }
}