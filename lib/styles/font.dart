import 'package:flutter/material.dart';
import 'package:notes/styles/Colors.dart';

class AppText {
   static double headerSize = 32; // Change this to modify font size
  static double bodySize = 20;


  static TextStyle get header => TextStyle(
    fontSize: headerSize,
    fontWeight: FontWeight.w700,
    fontFamily: "Raleway",
    color: AppColors.bodyColor
  );

  static TextStyle get body => TextStyle(
        fontSize: bodySize,
        fontWeight: FontWeight.bold,
        fontFamily: "Raleway",
        color: AppColors.bodyColor,
      );
}