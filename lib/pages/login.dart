import 'package:flutter/material.dart';
import 'package:notes/service/auth_service.dart';
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
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final auth = Auth();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
              NormField("Email", emailController,icon: Icon(Icons.email),),
              SizedBox(
                height: 20,
              ),
              passwordField(label: "Password",controller: passwordController,),
              //f
              // NormField("Password", passwordController,icon: Icon(Icons.password),),
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
                  onPressed: () async {
                    if (emailController.text.isNotEmpty &&
                        passwordController.text.length > 6) {
                      try {
                        await auth.signInWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                        Navigator.popAndPushNamed(context,
                            "/home"); // Navigate after successful login
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text("Login Failed: ${e.toString()}")),
                        );
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Invalid email or password")),
                      );
                    }
                  },
                  style: AppButton.ElevatedStyle,
                  child: Text(
                    "Login",
                    style: AppText.bodyStyle(),
                  )),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an Account?",
                    style: AppText.body1Style(),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.popAndPushNamed(context, "/register");
                      },
                      child: Text("Sign Up", style: AppText.LinkTextStyle()))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text("Or Login With", style: AppText.body1Style()),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 25,
                    child: IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        "assets/images/facebook.png",
                        height: 30,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 25,
                    child: IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        "assets/images/google.png",
                        height: 30,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
