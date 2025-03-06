import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notes/pages/form.dart';
import 'package:notes/pages/front.dart';
import 'package:notes/pages/home.dart';
import 'package:notes/pages/login.dart';
import 'package:notes/pages/register.dart';
import 'package:notes/pages/task.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //trial
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      // home: Homepage(),
      routes: {
        "/": (context) => const Front(),
        "/form": (context) => form(),
        "/login":(context)=>Login(),
        "/register":(context)=>Register(),
        "/home":(context)=>Homepage(),
        "/task":(context)=>task()
      },
    );
  }
}
