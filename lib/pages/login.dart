import 'package:flutter/material.dart';
import 'package:notes/styles/Colors.dart';
import 'package:notes/styles/font.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();

}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
  //Changing classes
  AppText.headerSize = 33;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        
        children: [
          Spacer(),
          Center(child: Text("Login",style: AppText.headerStyle(),),),
          Center(child: Text("Login Back To Your Account And Resume Where You Left Off.",style: AppText.bodyStyle(), textAlign: TextAlign.center,))
        ],
      ),
    );
  }
}