import 'package:flutter/material.dart';
import 'package:notes/pages/form.dart';
import 'package:notes/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      // home: Homepage(),
      routes: {"/": (context) => const Homepage(), "/form": (context) => form()},
    );
  }
}
