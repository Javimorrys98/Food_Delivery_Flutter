import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/controllers/recommended_product_controller.dart';
import 'package:food_delivery/pages/food/popular_food_detail.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_column.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/icon_and_text_widget.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:get/get.dart';

import '../../models/products_model.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = Dimensions.pageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Sliders
        GetBuilder<PopularProductController>(
          builder: (popularProducts) => popularProducts.isLoaded
              ? Container(
                  height: Dimensions.pageView,
                  child: GestureDetector(
                    onTap: (){
                      Get.toNamed(RouteHelper.getPopularFood());
                    },
                    child: PageView.builder(
                      controller: pageController,
                      itemCount: popularProducts.popularProductList.length,
                      itemBuilder: (context, position) => _buildPageItem(
                          position, popularProducts.popularProductList[position]),
                    ),
                  ),
                )
              : const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: CircularProgressIndicator(
                    color: AppColors.mainColor,
                  ),
                ),
        ),
        //Dots
        GetBuilder<PopularProductController>(
          builder: (popularProducts) => DotsIndicator(
            dotsCount: popularProducts.popularProductList.isEmpty
                ? 1
                : popularProducts.popularProductList.length,
            position: _currPageValue,
            decorator: DotsDecorator(
                size: Size.square(Dimensions.responsiveHeight(10)),
                activeColor: AppColors.mainColor,
                activeSize: Size(Dimensions.responsiveWidth(20),
                    Dimensions.responsiveHeight(10)),
                activeShape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(Dimensions.responsiveHeight(5)))),
          ),
        ),
        //PopularText
        SizedBox(
          height: Dimensions.responsiveHeight(30),
        ),
        Container(
          margin: EdgeInsets.only(left: Dimensions.responsiveWidth(30)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(
                text: "Recomendados",
              ),
              SizedBox(
                width: Dimensions.responsiveWidth(10),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: BigText(
                  text: ".",
                  color: Colors.black,
                ),
              ),
              SizedBox(
                width: Dimensions.responsiveWidth(10),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: SmallText(text: "Platos populares"),
              ),
            ],
          ),
        ),
        //List
        SizedBox(
          height: Dimensions.responsiveHeight(10),
        ),
        GetBuilder<RecommendedProductController>(
          builder: (recommendedProduct) => recommendedProduct.isLoaded
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: recommendedProduct.recommendedProductList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(
                          left: Dimensions.responsiveWidth(20),
                          right: Dimensions.responsiveWidth(20),
                          bottom: Dimensions.responsiveHeight(10)),
                      child: Row(
                        children: [
                          //Image section
                          Container(
                            width: Dimensions.responsiveWidth(120),
                            height: Dimensions.responsiveHeight(120),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  Dimensions.responsiveHeight(20)),
                              color: Colors.white38,
                              image:  DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  AppConstants.BASE_URL+AppConstants.UPLOAD_URL+recommendedProduct.recommendedProductList[index].img!,
                                ),
                              ),
                            ),
                          ),
                          //Text container
                          Expanded(
                            child: Container(
                              height: Dimensions.responsiveHeight(100),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(
                                      Dimensions.responsiveHeight(20)),
                                  topRight: Radius.circular(
                                      Dimensions.responsiveHeight(20)),
                                ),
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: Dimensions.responsiveWidth(10),
                                  right: Dimensions.responsiveWidth(10),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    BigText(text: recommendedProduct.recommendedProductList[index].name!),
                                    SizedBox(
                                      height: Dimensions.responsiveHeight(10),
                                    ),
                                    SmallText(
                                        //maxLines: 3,
                                        text:
                                            recommendedProduct.recommendedProductList[index].description!),
                                    SizedBox(
                                      height: Dimensions.responsiveHeight(10),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        IconAndTextWidget(
                                          icon: Icons.circle_sharp,
                                          text: "Normal",
                                          iconColor: AppColors.yellowColor,
                                          iconSize: 15,
                                        ),
                                        IconAndTextWidget(
                                          icon: Icons.location_on,
                                          text: "1.7 km",
                                          iconColor: AppColors.mainColor,
                                          iconSize: 15,
                                        ),
                                        IconAndTextWidget(
                                          icon: Icons.access_alarm_rounded,
                                          text: "32min",
                                          iconColor: AppColors.iconColor2,
                                          iconSize: 15,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )
              : const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: CircularProgressIndicator(
                    color: AppColors.mainColor,
                  ),
                ),
        ),
      ],
    );
  }

  Widget _buildPageItem(int index, ProductModel popularProduct) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(
                left: Dimensions.responsiveWidth(10),
                right: Dimensions.responsiveWidth(10)),
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(Dimensions.responsiveHeight(30)),
                color: index.isEven
                    ? const Color(0xFF69c5df)
                    : const Color(0xFF9294cc),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    AppConstants.BASE_URL +AppConstants.UPLOAD_URL+ popularProduct.img!,
                  ),
                )),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(
                  left: Dimensions.responsiveWidth(30),
                  right: Dimensions.responsiveWidth(30),
                  bottom: Dimensions.responsiveHeight(30)),
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(Dimensions.responsiveHeight(20)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFe8e8e8),
                      blurRadius: Dimensions.responsiveHeight(5),
                      offset: const Offset(5, 5),
                    ),
                    const BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                    const BoxShadow(color: Colors.white, offset: Offset(5, 0))
                  ]),
              child: Container(
                  padding: EdgeInsets.only(
                    top: Dimensions.responsiveHeight(15),
                    left: Dimensions.responsiveWidth(15),
                    right: Dimensions.responsiveWidth(15),
                  ),
                  child: AppColumn(
                    title: popularProduct.name!,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
