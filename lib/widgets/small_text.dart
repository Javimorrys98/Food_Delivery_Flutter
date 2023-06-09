// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../utils/dimensions.dart';

class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;
  //int? maxLines;
  SmallText({
    Key? key,
    this.color = const Color(0xFFccc7c5),
    required this.text,
    this.size=0,
    this.height=1.2,
    //this.maxLines=0
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Roboto',
        color: color,
        fontSize: size==0?Dimensions.responsiveHeight(12):size,
        height: height
      ),
      //maxLines: maxLines==0?null:maxLines,
      //overflow: TextOverflow.ellipsis,
    );
  }
}
