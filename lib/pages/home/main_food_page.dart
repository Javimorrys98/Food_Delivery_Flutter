import 'package:flutter/material.dart';
import 'package:food_delivery/pages/home/food_page_body.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/small_text.dart';

import '../../utils/colors.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    print("current height is " + MediaQuery.of(context).size.height.toString());
    print("current width is " + MediaQuery.of(context).size.width.toString());
    return Scaffold(
      body: Column(
        children: [
          //Showing the header
          Container(
            margin: EdgeInsets.only(
                top: Dimensions.responsiveHeight(30),
                bottom: Dimensions.responsiveHeight(15)),
            padding: EdgeInsets.only(
                left: Dimensions.responsiveWidth(20),
                right: Dimensions.responsiveWidth(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    BigText(
                      text: "España",
                      color: AppColors.mainColor,
                    ),
                    Row(
                      children: [
                        SmallText(
                          text: "Sevilla",
                          color: Colors.black54,
                        ),
                        const Icon(Icons.arrow_drop_down_rounded)
                      ],
                    )
                  ],
                ),
                Center(
                  child: Container(
                    width: Dimensions.responsiveWidth(45),
                    height: Dimensions.responsiveHeight(45),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          Dimensions.responsiveHeight(15)),
                      color: AppColors.mainColor,
                    ),
                    child: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
          //Showing the body
          const Expanded(
            child: SingleChildScrollView(
              child: FoodPageBody(),
            ),
          ),
        ],
      ),
    );
  }
}
