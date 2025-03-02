import 'package:flutter/material.dart';
import 'package:notes/styles/Colors.dart';

class AppText {
  // Font Size
  static double headerSize = 32;
  static double bodySize = 20;

  // Font Weight
  static FontWeight headerWeight = FontWeight.w700;
  static FontWeight bodyWeight = FontWeight.bold;
  

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
}
