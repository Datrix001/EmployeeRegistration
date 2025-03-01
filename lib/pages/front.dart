import 'dart:math' as math;


import 'package:flutter/material.dart';

class Front extends StatelessWidget {
  const Front({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(120, 134, 199, 1.0),
        body: Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 20, top: 100, right: 20),
                child: Text(
                  "The best app for employee registration",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Urbanist",
                      fontSize: math.min(MediaQuery.of(context).size.width * 0.14, 90),
                ),
              ),),
              SizedBox(
                height: 200,
              ),
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(MediaQuery.of(context).size.width * 0.7, 50),
                      backgroundColor: Color.fromRGBO(45, 51, 107, 1.0)),
                  child: Text("Sign In",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: "Raleway"))),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Create an account",
                    style: TextStyle(color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    fontFamily: "Raleway"),
                  ))
          ],
          ),
        ));
  }
}
