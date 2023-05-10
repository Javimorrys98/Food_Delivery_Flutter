import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_column.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/expandable_text_widget.dart';

import '../../utils/colors.dart';
import '../../widgets/big_text.dart';
import '../../widgets/icon_and_text_widget.dart';
import '../../widgets/small_text.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //Background image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.responsiveHeight(350),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        "assets/image/food0.jpg",
                      ))),
            ),
          ),
          //Back and cart icons
          Positioned(
            top: Dimensions.responsiveHeight(30),
            left: Dimensions.responsiveWidth(20),
            right: Dimensions.responsiveWidth(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.arrow_back_ios),
                AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            ),
          ),
          //Details card
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.responsiveHeight(350 - 20),
            child: Container(
                padding: EdgeInsets.only(
                  left: Dimensions.responsiveWidth(20),
                  right: Dimensions.responsiveWidth(20),
                  top: Dimensions.responsiveHeight(20),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      Dimensions.responsiveHeight(20),
                    ),
                    topRight: Radius.circular(
                      Dimensions.responsiveHeight(20),
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppColumn(
                      title: "Huevo escalfado al PX",
                      textSize: 23,
                    ),
                    SizedBox(
                      height: Dimensions.responsiveHeight(20),
                    ),
                    BigText(text: "Descripción"),
                    SizedBox(height: Dimensions.responsiveHeight(20),),
                    const Expanded(
                      child: SingleChildScrollView(
                        child: ExpandableTextWidget(
                            text:
                                "Huevo de gallinas camperas criadas en libertad acompañado de una tosta de pan de centeno, salsa tártara y una reducción de Pedro Ximénez denominación de origen."),
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: Dimensions.responsiveHeight(120),
        padding: EdgeInsets.symmetric(
            vertical: Dimensions.responsiveHeight(30),
            horizontal: Dimensions.responsiveWidth(20)),
        decoration: BoxDecoration(
            color: AppColors.buttonBackgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimensions.responsiveHeight(40)),
              topRight: Radius.circular(Dimensions.responsiveHeight(40)),
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(Dimensions.responsiveHeight(20)),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.remove,
                    color: AppColors.signColor,
                  ),
                  SizedBox(
                    width: Dimensions.responsiveHeight(5),
                  ),
                  BigText(text: "0"),
                  SizedBox(
                    width: Dimensions.responsiveHeight(5),
                  ),
                  const Icon(
                    Icons.add,
                    color: AppColors.signColor,
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(Dimensions.responsiveHeight(20)),
                color: AppColors.mainColor,
              ),
              child: Row(
                children: [
                  BigText(
                    text: "4.50€",
                    color: Colors.white,
                    size: 18,
                  ),
                  SizedBox(
                    width: Dimensions.responsiveWidth(5),
                  ),
                  BigText(
                    text: "|",
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: Dimensions.responsiveWidth(5),
                  ),
                  BigText(
                    text: "Add to cart",
                    color: Colors.white,
                    size: 18,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
