import 'package:flutter/material.dart';
import 'package:notes/service/auth_service.dart';
import 'package:notes/styles/Colors.dart';
import 'package:notes/styles/buttons.dart';
import 'package:notes/styles/font.dart';
import 'package:notes/styles/textField.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
                height: 50,
              ),
              Center(
                child: Text(
                  "Sign Up",
                  style: AppText.headerStyle(),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Center(
                  child: Text(
                "Create Your Account For Employeee And Start Managing Your Employees Today!",
                style: AppText.bodyStyle(),
                textAlign: TextAlign.center,
              )),
              SizedBox(
                height: 40,
              ),
              NormField("Full Name", null,icon: Icon(Icons.person),),
              SizedBox(
                height: 20,
              ),
              NormField("Email", emailController,icon: Icon(Icons.email),),
              SizedBox(
                height: 20,
              ),
              NormField("Password", passwordController,icon: Icon(Icons.lock),),
              SizedBox(
                height: 20,
              ),
              NormField("Confirm Password", null,icon: Icon(Icons.lock),),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () async {
                    if (emailController.text.isNotEmpty &&
                        passwordController.text.length > 6) {
                      try {
                        await auth.createUSerWithEmailAndPassword(
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
                    "Register",
                    style: AppText.bodyStyle(),
                  )),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already Have An Account?",
                    style: AppText.body1Style(),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.popAndPushNamed(context, "/login");
                      },
                      child: Text("Login Here", style: AppText.LinkTextStyle()))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text("Or Sign Up With", style: AppText.body1Style()),
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
