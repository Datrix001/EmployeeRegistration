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

  String DropValue = "HR";
  String DropValue1 = "HR";

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
    AppText.bodySize = 18;
    AppText.body1Color = Colors.black;
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
      body: SingleChildScrollView(
        child: Container(
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
                height: 40,
              ),
              DropdownMenu(
                label: Text("Select Position"),
                width: 340,
                inputDecorationTheme: InputDecorationTheme(
                    // border: OutlineInputBorder(
                    //     // borderSide: BorderSide(color:Colors.white),
                    //     borderRadius: BorderRadius.circular(20,)
                    //     ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(width: 2,color: Colors.white)
                        )
                        ),
                // label: Text("Select Position"),
                initialSelection: DropValue,
                dropdownMenuEntries: <DropdownMenuEntry<String>>[
                  DropdownMenuEntry(
                      value: "HR",
                      label: "Human Resource Manager",
                      style: ButtonStyle(
                          // backgroundColor: MaterialStateProperty.all(AppColors.backgroundColor)
                          )),
                  DropdownMenuEntry(value: "Director", label: "Director"),
                  DropdownMenuEntry(value: "Manager", label: "Manager"),
                  DropdownMenuEntry(value: "Emp", label: "Employee"),
                ],
                onSelected: (value) {
                  if (value != null) {
                    setState(() {
                      DropValue = value;
                    });
                  }
                },
              ),
              SizedBox(height: 30,),
              DropdownMenu(
                label: Text("Select Task"),
                width: 340,
                inputDecorationTheme: InputDecorationTheme(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(width: 2,color: Colors.white)
                        )
                        ),
                initialSelection: DropValue,
                dropdownMenuEntries: <DropdownMenuEntry<String>>[
                  DropdownMenuEntry(
                      value: '1',
                      label: "Task1",
                      style: ButtonStyle(
                          )),
                  DropdownMenuEntry(value: "1", label: "Task1"),
                  DropdownMenuEntry(value: "2", label: "Task2"),
                  DropdownMenuEntry(value: "3", label: "Task3"),
                ],
                onSelected: (value) {
                  if (value != null) {
                    setState(() {
                      DropValue1 = value;
                    });
                  }
                },
              ),
              SizedBox(
                height: 50,
              ),
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      final user = User(
                          name: nameController.text,
                          age: ageController.text,
                          location: locationController.text,
                          position: DropValue,
                          task:DropValue1);
                      if (user.name.isNotEmpty &&
                          user.age.isNotEmpty &&
                          user.location.isNotEmpty &&
                          user.position.isNotEmpty) {
                        addDetails(
                            name: user.name,
                            age: user.age,
                            location: user.location,
                            position: user.position);
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
      ),
    );
  }
}

class User {
  String id;
  final String name;
  final String age;
  final String location;
  final String position;
  final String task;

  User( 
      {this.id = "",
      required this.name,
      required this.age,
      required this.location,
      required this.position,
      required this.task,});

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'age': age,
        'location': location,
        'task':task
      };

  static User fromJson(Map<String, dynamic> json) => User(
      id: json['id'],
      age: json['age'],
      location: json['location'],
      name: json['name'],
      position: json['position'],
      task:json['task']);
}
