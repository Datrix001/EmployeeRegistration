import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:notes/color/Colors.dart';

class Front extends StatelessWidget {
  const Front({super.key});
  

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              ClipPath(
                clipper: bigClipper(),
                child: Container(
                  height: 170,
                  color: Color(0xFF2D336B),
                ),
              ),
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
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: height*0.06,vertical: width*0.4),
                    child: Text(
                      "The best app for employee registration",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Urbanist",
                        fontSize: math.min(
                            MediaQuery.of(context).size.width * 0.14, 90),
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/login");
                      },
                      style: ElevatedButton.styleFrom(
                          minimumSize:
                              Size(MediaQuery.of(context).size.width * 0.7, 50),
                          backgroundColor: Color.fromRGBO(45, 51, 107, 1.0)),
                      child: Text("Sign In",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              fontFamily: "Raleway"))),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/register");
                      },
                      child: Text(
                        "Create an account",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            fontFamily: "Raleway"),
                      ))
                ],
              ),
            ],
          ),
        ));
  }
}

class bigClipper extends CustomClipper<Path>{
  @override
  getClip(Size size) {
    var path = new Path();
    path.lineTo(0, size.height);
    var firstStart = Offset(size.width/4, size.height-50);
    var firstEnd = Offset(size.width/2, size.height-30);

    path.quadraticBezierTo(firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);
    var secondStart = Offset(3*size.width/4,size.height);
    var secondEnd = Offset(size.width,size.height-40);
    path.quadraticBezierTo(secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
    
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }

}

class WaveClipper extends CustomClipper<Path>{
  @override
  getClip(Size size) {
    var path = new Path();
    path.lineTo(0, size.height);
    var firstStart = Offset(size.width/5, size.height);
    var firstEnd = Offset(size.width/2.25, size.height-50);

    path.quadraticBezierTo(firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);
    var secondStart = Offset(size.width-(size.width/3.24),size.height-105);
    var secondEnd = Offset(size.width,size.height-10);
    path.quadraticBezierTo(secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
    
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }

}

