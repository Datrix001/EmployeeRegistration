import 'package:flutter/material.dart';
import 'package:notes/color/Colors.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register"),),
      backgroundColor: AppColors.backgroundColor,
    );
  }
}