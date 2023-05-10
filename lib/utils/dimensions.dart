import 'package:get/get.dart';

class Dimensions{
  //*SCREEN SIZE*//
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;
  //* /////////////////////////////// *//

  //*CONTAINER SPECIFICS*//
  static double pageViewContainer = screenHeight/3.84;
  static double pageViewTextContainer = screenHeight/7.03;
  static double pageView = screenHeight/2.64;
  //* /////////////////////////////// *//

  //*HEIGHT*//
  // Si la altura de la pantalla es 844 lo dividimos entre la altura que queremos: 
  // 844/10=84.4 Para devolver el valor correcto dividimos la altura de la pantalla entre dicho valor.

  // static double height10 = screenHeight/84.4;

  static double responsiveHeight(double height){
    double scale = 844/height;
    return screenHeight/scale;
  }
  //* /////////////////////////////// *//

  //*WIDTH*//
  // Si la anchura de la pantalla es 390 lo dividimos entre la anchura que queremos: 
  // 390/10=39.0 Para devolver el valor correcto dividimos la anchura de la pantalla entre dicho valor.

  // static double width10 = screenWidth/39.0;

  static double responsiveWidth(double width){
    double scale = 390/width;
    return screenWidth/scale;
  }
  //* /////////////////////////////// *//

}