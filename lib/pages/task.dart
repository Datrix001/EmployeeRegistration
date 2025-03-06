import 'package:flutter/material.dart';
import 'package:notes/service/database.dart';
import 'package:notes/styles/Colors.dart';
import 'package:notes/styles/buttons.dart';
import 'package:notes/styles/font.dart';
import 'package:notes/styles/textField.dart';

class task extends StatefulWidget {
  const task({super.key});

  @override
  State<task> createState() => _taskState();
}

class _taskState extends State<task> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final locationController = TextEditingController();
  final _dateController = TextEditingController();

  String DropValue = "HR";

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
                "Task Creation",
                style: AppText.headerStyle(),
              )),
              SizedBox(
                height: 40,
              ),
              NormField("Task Name", nameController),
              SizedBox(
                height: 40,
              ),
              TextField(
                controller: _dateController,
                decoration: InputDecoration(
                  label: Text("Select Date",style: AppText.body1Style(),),
                  prefixIcon: Icon(Icons.calendar_month),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(width: 2, color: Colors.white)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(width: 2, color: Colors.white)),
                ),
                onTap: () {
                  _selectDate();
                },
                readOnly: true,
              ),
              
              SizedBox(
                height: 40,
              ),
              TextField(
                minLines:
                    6, // any number you need (It works as the rows for the textarea)
                // keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  // labelText: "Enter Task Description",
                  label: Text("Enter Task Description",style:AppText.body1Style(),),
                  alignLabelWithHint: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.white)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.white)
                  )
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      // final user = User(
                      //     name: nameController.text,
                      //     age: ageController.text,
                      //     location: locationController.text,
                      //     position: DropValue);
                      // if (user.name.isNotEmpty &&
                      //     user.age.isNotEmpty &&
                      //     user.location.isNotEmpty &&
                      //     user.position.isNotEmpty) {
                      //   addDetails(
                      //       name: user.name,
                      //       age: user.age,
                      //       location: user.location,
                      //       position: user.position);
                      //   Navigator.popAndPushNamed(context, "/home");
                      // }
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

  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2050));
    if (picked != null) {
      setState(() {
        _dateController.text = picked.toString().split(" ")[0];
      });
    }
  }
}
