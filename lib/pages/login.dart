import 'package:flutter/material.dart';
import 'package:notes/styles/Colors.dart';
import 'package:notes/styles/buttons.dart';
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
          SizedBox(
            height: 100,
          ),
          Center(
            child: Text(
              "Login",
              style: AppText.headerStyle(),
            ),
          ),
          Center(
              child: Text(
            "Login Back To Your Account And Resume Where You Left Off.",
            style: AppText.bodyStyle(),
            textAlign: TextAlign.center,
          )),
          Text("Email Here"),
          TextField(),
          Text("Password"),
          TextField(),
          Text("Forgot Password"),
          ElevatedButton(
              onPressed: () {},
              style: AppButton.ElevatedStyle,
              child: Text(
                "Login",
                style: AppText.bodyStyle(),
              )),
          Text("Or Login With"),
          ElevatedButton(
              onPressed: () {},
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/facebook.png",
                    height: 20,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text("Sign Up With Facebook")
                ],
              )),
          ElevatedButton(
              onPressed: () {},
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/facebook.png",
                    height: 20,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text("Sign Up With Facebook")
                ],
              )),

              Row(
                children: [
                  Text("Don't have an Account?"),
                  TextButton(onPressed: (){}, child: Text("Sign Up Here"))
                ],
              )
        ],
      ),
    );
  }
}
