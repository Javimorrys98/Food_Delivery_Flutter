import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/small_text.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'big_text.dart';
import 'icon_and_text_widget.dart';

class AppColumn extends StatelessWidget {
  final String title;
  final double? textSize;

  const AppColumn({super.key,
  required this.title,
  this.textSize=0,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(
                    text: title,
                    size: textSize==0 ? 0:textSize!,
                  ),
                  SizedBox(
                    height: Dimensions.responsiveHeight(10),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(
                                5,
                                (index) => Icon(
                                      Icons.star,
                                      color: AppColors.mainColor,
                                      size: Dimensions.responsiveHeight(15),
                                    )),
                          ),
                          SizedBox(width: Dimensions.responsiveWidth(10),),
                          SmallText(text: "4.5"),
                        ],
                      ),
                      //SizedBox(width: Dimensions.responsiveWidth(10),),
                      SmallText(text: "1287 Comentarios"),
                    ],
                  ),
                  SizedBox(
                    height: Dimensions.responsiveHeight(20),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      IconAndTextWidget(
                        icon: Icons.circle_sharp,
                        text: "Normal",
                        iconColor: AppColors.yellowColor,
                      ),
                      IconAndTextWidget(
                        icon: Icons.location_on,
                        text: "1.7 km",
                        iconColor: AppColors.mainColor,
                      ),
                      IconAndTextWidget(
                        icon: Icons.access_alarm_rounded,
                        text: "32min",
                        iconColor: AppColors.iconColor2,
                      ),
                    ],
                  ),
                ],
              );
  }
}