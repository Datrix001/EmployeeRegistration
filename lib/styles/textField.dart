import 'package:flutter/material.dart';
import 'package:notes/styles/font.dart';

class NormField {
  final String? hint;
  final String label;
  final TextEditingController? controller;
  NormField(this.label,this.controller, {this.hint});


  Widget normal() {
    return TextField(
      controller: controller,
      style: AppText.body1Style(),
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        hintStyle : AppText.body1Style(),
        labelStyle: AppText.body1Style(),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: Colors.white,
            width: 2
          )
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: Colors.white,
            width: 2
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: Colors.white,
            width: 2
          ),
        ),
      ),
    );
  }
}