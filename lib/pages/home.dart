import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: ()=>{
        Navigator.pushNamed(context, "/form")
      }, child:Icon(Icons.add)),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                "Flutter",
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold),),
                Text(
                  "Firebase",
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.orange,
                      fontWeight: FontWeight.bold),
                )
          ],
        ),
      ),
    );
  }
}
