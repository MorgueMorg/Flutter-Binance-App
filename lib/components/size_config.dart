import 'package:flutter/material.dart';

// Для адаптивности экранов
class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static double? defaultSize;
  static Orientation? orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}

// Получение пропорциональной высоты в соответствии с размером экрана
double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  // 812 - высота макета дизайнера
  return (inputHeight / 812.0) * screenHeight;
}

// Получение пропорциональной ширины в соответствии с размером экрана
double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  // 375 - ширина макета дизайнера
  return (inputWidth / 375.0) * screenWidth;
}
