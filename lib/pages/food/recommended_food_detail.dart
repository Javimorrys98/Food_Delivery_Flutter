import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/expandable_text_widget.dart';
import 'package:food_delivery/widgets/small_text.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: Dimensions.responsiveHeight(80),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.clear),
                AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(Dimensions.responsiveHeight(20)),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft:
                            Radius.circular(Dimensions.responsiveHeight(20)),
                        topRight:
                            Radius.circular(Dimensions.responsiveHeight(20)))),
                width: double.maxFinite,
                padding: EdgeInsets.only(
                    top: Dimensions.responsiveHeight(5),
                    bottom: Dimensions.responsiveHeight(10)),
                child: Center(
                  child: BigText(
                    text: "Huevo escalfado al PX",
                    size: Dimensions.responsiveHeight(26),
                  ),
                ),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: Dimensions.responsiveHeight(300),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/image/food0.jpg",
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: Dimensions.responsiveWidth(20)),
                  child: const ExpandableTextWidget(
                      text:
                          "Huevo de gallina criada en libertad escalfado a baja temperatura sobre tosta de pan de centeno procedente de Kiev acompañado de una emulsión de salsa tártara con mostaza veneciana y reducción de Pedro Ximénez denominación de origen. Guarnición de patatas gallegas seleccionadas a mano y confitadas en aceite de avestruz. Muchos mas detalles que tengo que usar para rellenar este texto y poder probar el scrolling :DDDD a ver si con esto ya es suficiente por favoh. Pues se ve que no lo ha sido así que tendre que contar mi vida por aqui fijate tu que tarea tan encomiable todo porque me da pereza poner un lorem ipsum estoy en el peak de la programacion ahora mismo jajaja a ver voy a probar otra vez. Pues nada que me falta otro poquito mas estoy sentado en una silla blanca y el raton funciona como el culo, la pantalla de mi movil esta llena de mierda y me quiero ir a mi casa ya que es viernes y el cuerpo lo sabeeee SIUUUUU"),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.responsiveWidth(50),
              vertical: Dimensions.responsiveHeight(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  iconSize: Dimensions.responsiveHeight(30),
                  size: Dimensions.responsiveHeight(40),
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  icon: Icons.remove,
                ),
                BigText(
                  text: "4,25€ " + " X " + " 0",
                  color: AppColors.mainBlackColor,
                  size: Dimensions.responsiveHeight(26),
                ),
                AppIcon(
                  iconSize: Dimensions.responsiveHeight(30),
                  size: Dimensions.responsiveHeight(40),
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  icon: Icons.add,
                ),
              ],
            ),
          ),
          Container(
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
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.responsiveWidth(20),
                      vertical: Dimensions.responsiveHeight(20),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          Dimensions.responsiveHeight(20)),
                      color: Colors.white,
                    ),
                    child: Icon(
                      Icons.favorite,
                      color: AppColors.mainColor,
                      size: Dimensions.responsiveHeight(25),
                    )),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
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
        ],
      ),
    );
  }
}
