import 'package:flutter/material.dart';
import 'package:notes/styles/Colors.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("Login",style: TextStyle(
              
            ),)
          ],
        ),
      ),
    );
  }
}