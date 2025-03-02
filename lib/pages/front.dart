import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:notes/content/Clipper.dart';
import 'package:notes/styles/Colors.dart';
import 'package:notes/styles/buttons.dart';
import 'package:notes/styles/font.dart';

class Front extends StatelessWidget {
  const Front({super.key});
  

  @override
  Widget build(BuildContext context) {
  
  //Changing Class Values
    AppText.bodySize = 20;
    AppText.headerSize = math.min(
                            MediaQuery.of(context).size.width * 0.14, 90);
    
    AppButton.buttonWidth = MediaQuery.of(context).size.width * 0.7;
    AppButton.buttonHeight = 50;

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              
              //Clipper Art
              //1st Clipper
              ClipPath(
                clipper: bigClipper(),
                child: Container(
                  height: 170,
                  color: AppColors.buttonColor,
                ),
              ),

              //2nd Clipper
              Opacity(
                opacity: 0.5,
                child: ClipPath(
                  clipper: WaveClipper(),
                  child:Container(
                    color: Color(0xFF7A73D1),
                    height: 200,
                  ) ,
                ),
              ),
              
              //Content
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: height*0.06,vertical: width*0.4),
                    child: Text(
                      "The best app for employee registration",
                      style: AppText.header,
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.popAndPushNamed(context, "/login");
                      },
                      style: AppButton.ElevatedStyle,
                      child: Text("Sign In",
                          style: AppText.body,
                          )),
                  TextButton(
                      onPressed: () {
                        Navigator.popAndPushNamed(context, "/register");
                      },
                      child: Text(
                        "Create an account",
                        style: AppText.body
                      ))
                ],
              ),
            ],
          ),
        ));
  }
}


