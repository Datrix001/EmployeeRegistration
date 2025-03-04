import 'package:flutter/material.dart';
import 'package:notes/service/database.dart';
import 'package:notes/styles/Colors.dart';
import 'package:notes/styles/buttons.dart';
import 'package:notes/styles/font.dart';
import 'package:notes/styles/textField.dart';

class form extends StatefulWidget {
  const form({super.key});

  @override
  State<form> createState() => _formState();
}

class _formState extends State<form> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final locationController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    locationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    AppText.bodySize = 18; // Set the value in initState()
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      // appBar: AppBar(
      //   backgroundColor: AppColors.backgroundColor,
      //   title: Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Text("EmployeeForm", style: AppText.headerStyle()),
      //     ],
      //   ),
      // ),
      body: Container(
        margin: EdgeInsets.only(left: 40, top: 30, right: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Center(
                child: Text(
              "EmployeeForm",
              style: AppText.headerStyle(),
            )),
            SizedBox(
              height: 40,
            ),
            NormField("Name", nameController),
            SizedBox(
              height: 40,
            ),
            NormField("Age", ageController),
            SizedBox(
              height: 40,
            ),
            NormField("Location", locationController),
            SizedBox(
              height: 50,
            ),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    final user = User(
                        name: nameController.text,
                        age: ageController.text,
                        location: locationController.text);
                    if (user.name.isNotEmpty &&
                        user.age.isNotEmpty &&
                        user.location.isNotEmpty) {
                      addDetails(
                          name: user.name,
                          age: user.age,
                          location: user.location);
                      Navigator.popAndPushNamed(context, "/home");
                    }
                  },
                  style: AppButton.ElevatedStyle,
                  child: Text(
                    "Submit",
                    style: AppText.bodyStyle(),
                  )),
            )
          ],
        ),
      ),
    );
  }
}

class User {
  String id;
  final String name;
  final String age;
  final String location;

  User({
    this.id = "",
    required this.name,
    required this.age,
    required this.location,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'age': age,
        'location': location,
      };

  static User fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        age: json['age'],
        location: json['location'],
        name: json['name'],
      );
}
