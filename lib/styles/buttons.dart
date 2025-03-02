import 'package:flutter/material.dart';
import 'package:notes/styles/Colors.dart';

class AppButton {
    static double buttonWidth = 200; // Default value
  static double buttonHeight = 50; // Default value
  static ButtonStyle get ElevatedStyle => ElevatedButton.styleFrom(
                          minimumSize: Size(buttonWidth,buttonHeight),
                          backgroundColor: AppColors.buttonColor);
}

