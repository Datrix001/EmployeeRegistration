import 'package:flutter/material.dart';
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
              NormField(
                "Full Name",
              ).normal(),
              SizedBox(
                height: 20,
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
              SizedBox(
                height: 20,
              ),
              NormField(
                "Password",
              ).normal(),
              SizedBox(
                height: 30,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already Have An Account?",style: AppText.body1Style(),),
                  TextButton(
                      onPressed: () {},
                      child: Text("Login Here",
                          style: AppText.LinkTextStyle()))
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
                    child: IconButton(onPressed: (){}, icon: Image.asset(
                          "assets/images/facebook.png",
                          height: 30,
                        ),),
                  ),
                  SizedBox(width: 20,),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 25,
                    child: IconButton(onPressed: (){}, icon: Image.asset(
                          "assets/images/google.png",
                          height: 30,
                        ),),
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
