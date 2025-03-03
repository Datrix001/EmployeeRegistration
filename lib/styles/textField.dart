import 'package:flutter/material.dart';
import 'package:notes/styles/font.dart';

class NormField {
  final String? hint;
  final String label;
  NormField(this.label, {this.hint});


  Widget normal() {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        hintStyle : AppText.body1Style(),
        labelStyle: AppText.body1Style(),
      ),
    );
  }
}