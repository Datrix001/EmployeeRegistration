
import 'package:flutter/material.dart';
import 'package:notes/styles/Colors.dart';

class AppText {
  // Font Size
  static double headerSize = 32;
  static double bodySize = 20;
  static double body1Size = 15;

  //Font Color
  static Color body1Color = Colors.white;
  static Color buttonColor = Colors.black;


  // Font Weight
  static FontWeight headerWeight = FontWeight.w700;
  static FontWeight bodyWeight = FontWeight.bold;
  static FontWeight body1Weight = FontWeight.w900;
  static FontWeight linkWeight = FontWeight.w700;

  

  // Use a method to get updated styles
  static TextStyle headerStyle() {
    return TextStyle(
      fontSize: headerSize,
      fontWeight: headerWeight,
      fontFamily: "Urbanist",
      color: AppColors.bodyColor,
    );
  }

  static TextStyle bodyStyle() {
    return TextStyle(
      fontSize: bodySize,
      fontWeight: bodyWeight,
      fontFamily: "Raleway",
      color: AppColors.bodyColor,
    );
  }
  static TextStyle body1Style() {
    return TextStyle(
      fontSize: body1Size,
      fontWeight: bodyWeight,
      fontFamily: "Raleway",
      color: body1Color
    );
  }
  static TextStyle buttonStyle() {
    return TextStyle(
      fontSize: body1Size,
      // fontStyle: fontStyle.bold,
      fontWeight: body1Weight,
      fontFamily: "Raleway",
      color: buttonColor
    );  
  }
  static TextStyle LinkTextStyle() {
    return TextStyle(
      fontSize: body1Size,
      fontWeight: linkWeight,
      fontFamily: "Urbanist",
      color: AppColors.buttonColor,
      // decoration: TextDecoration.underline,
      // decorationColor:AppColors.buttonColor
    );
}
}
