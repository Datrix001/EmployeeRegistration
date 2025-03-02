import 'package:flutter/material.dart';
import 'package:notes/color/Colors.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login"),),
      backgroundColor: AppColors.backgroundColor,

    );
  }
}