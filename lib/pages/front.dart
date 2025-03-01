import 'package:flutter/material.dart';

class Front extends StatelessWidget {
  const Front({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(120, 134, 199, 1.0),
        body: Column(
          children: [
            Container(
                  padding: EdgeInsets.only(left: 50, top: 100, right: 50),
                  child: Text(
            "The best app for employee registration",
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: MediaQuery.of(context).size.width * 0.14),
                  ),
                ),
                SizedBox(height: 200,),
                ElevatedButton(onPressed: (){}, child: Text("Sign In")),
                TextButton(onPressed: (){}, child: Text("Create an account"))
          ],
        ));
  }
}
