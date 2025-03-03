import 'package:flutter/material.dart';
import 'package:notes/styles/Colors.dart';
import 'package:notes/styles/buttons.dart';
import 'package:notes/styles/font.dart';
import 'package:notes/styles/textField.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    //Changing classes
    AppText.headerSize = 40;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    // AppText.body1Color = Colors.white;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: height * 0.06, vertical: width * 0.02),
        child: SingleChildScrollView(
          child: Column(
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
              SizedBox(
                height: 40,
              ),
              Center(
                  child: Text(
                "Login Back To Your Account And Resume Where You Left Off.",
                style: AppText.bodyStyle(),
                textAlign: TextAlign.center,
              )),
              SizedBox(
                height: 40,
              ),
              NormField(
                "Email",
              ).normal(),
              SizedBox(
                height: 20,
              ),
              NormField(
                "Password",
              ).normal(),
              Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forgot Password",
                        style: AppText.body1Style(),
                      ))),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.popAndPushNamed(context, "/home");
                  },
                  style: AppButton.ElevatedStyle,
                  child: Text(
                    "Login",
                    style: AppText.bodyStyle(),
                  )),
              SizedBox(
                height: 40,
              ),
              Text("Or Login With", style: AppText.body1Style()),
              SizedBox(
                height: 20,
              ),
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
                      Text("Sign Up With Facebook",
                          style: AppText.buttonStyle())
                    ],
                  )),
              ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/google.png",
                        height: 20,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text("Sign Up With Google", style: AppText.buttonStyle())
                    ],
                  )),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text("Don't have an Account? Sign Up Here",
                          style: AppText.LinkTextStyle()))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
