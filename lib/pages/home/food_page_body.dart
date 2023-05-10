import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_column.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/icon_and_text_widget.dart';
import 'package:food_delivery/widgets/small_text.dart';

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
        Container(
          height: Dimensions.pageView,
          child: PageView.builder(
            controller: pageController,
            itemCount: 5,
            itemBuilder: (context, position) {
              return _buildPageItem(position);
            },
          ),
        ),
        //Dots
        DotsIndicator(
          dotsCount: 5,
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
                text: "Popular",
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
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 10,
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
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/image/food1.jpg"),
                      ),
                    ),
                  ),
                  //Text container
                  Expanded(
                    child: Container(
                      height: Dimensions.responsiveHeight(100),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomRight:
                              Radius.circular(Dimensions.responsiveHeight(20)),
                          topRight:
                              Radius.circular(Dimensions.responsiveHeight(20)),
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
                            BigText(text: "Tortilla de patatas"),
                            SizedBox(
                              height: Dimensions.responsiveHeight(10),
                            ),
                            SmallText(
                                text:
                                    "Con huevos de gallinas criadas en el suelo"),
                            SizedBox(
                              height: Dimensions.responsiveHeight(10),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
        ),
      ],
    );
  }

  Widget _buildPageItem(int index) {
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
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    "assets/image/food0.jpg",
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
                  child: const AppColumn(title: "Huevo escalfado al PX",)),
            ),
          )
        ],
      ),
    );
  }
}
