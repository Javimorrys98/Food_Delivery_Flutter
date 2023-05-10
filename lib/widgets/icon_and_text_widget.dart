import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/small_text.dart';

import '../utils/dimensions.dart';

class IconAndTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
  final double? iconSize;

  const IconAndTextWidget(
      {super.key,
      required this.icon,
      required this.text,
      required this.iconColor,
      this.iconSize=0});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: iconSize==0? Dimensions.responsiveHeight(25):Dimensions.responsiveHeight(iconSize!),
        ),
        SizedBox(
          width: Dimensions.responsiveWidth(5),
        ),
        SmallText(
          text: text,
        )
      ],
    );
  }
}
