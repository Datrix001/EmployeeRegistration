import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:notes/pages/form.dart';
import 'package:notes/service/database.dart';
import 'package:notes/styles/Colors.dart';
import 'package:notes/styles/font.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final locationController = TextEditingController();
  final positionController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    locationController.dispose();
    positionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        floatingActionButton: SpeedDial(
          backgroundColor: AppColors.buttonColor,
          animatedIcon: AnimatedIcons.menu_close,
          overlayColor: Colors.black,
          overlayOpacity: 0.4,
          spacing: 10,
          spaceBetweenChildren: 5,
          children: [
            SpeedDialChild(
                child: Icon(Icons.person),
                label: "Add Employee",
                // backgroundColor: AppColors.buttonColor,
                onTap: () {
                  Navigator.pushNamed(context, "/form");
                }),
            SpeedDialChild(
                child: Icon(Icons.task),
                // backgroundColor: AppColors.buttonColor,
                label: "Add a task",
                onTap: () {
                  Navigator.pushNamed(context, "/task");
                })
          ],
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Padding(padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30)),
            Center(
              child: Text("Employee Details",style: AppText.headerStyle(),),
            ),
            Container(
              margin: EdgeInsets.only(left: 30,right: 30),
              child: StreamBuilder<List<User>>(
                  stream: readUser(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                          child: CircularProgressIndicator()); // Show loading
                    }
                    if (snapshot.hasError) {
                      return Center(
                          child: Text("Error loading data")); // Handle errors
                    }
                    if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(
                          child: Text("No users found")); // Handle empty state
                    }
                    final users = snapshot.data!;

                    return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: users.length,
                        itemBuilder: (context, index) {
                          final user = users[index];

                          return Column(children: [
                            Material(
                              elevation: 5,
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                padding: EdgeInsets.all(20),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              "Name : ${user.name}",
                                              style: TextStyle(
                                                  color: Colors.blue,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          // SizedBox(width: 100,),
                                          IconButton(
                                              onPressed: () {
                                                nameController.text = user.name;
                                                ageController.text = user.age;
                                                locationController.text =
                                                    user.location;
                                                positionController.text =
                                                    user.position;
                                                showDialog(
                                                    context: context,
                                                    builder:
                                                        (context) =>
                                                            AlertDialog(
                                                              title: Text(
                                                                "Edit",
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                              content:
                                                                  SingleChildScrollView(
                                                                child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        "Name",
                                                                        style: TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.bold),
                                                                      ),
                                                                      TextField(
                                                                        controller:
                                                                            nameController,
                                                                        decoration:
                                                                            InputDecoration(hintText: user.name),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            20,
                                                                      ),
                                                                      Text(
                                                                        "Age",
                                                                        style: TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.bold),
                                                                      ),
                                                                      TextField(
                                                                        controller:
                                                                            ageController,
                                                                        decoration:
                                                                            InputDecoration(hintText: user.age),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            20,
                                                                      ),
                                                                      Text(
                                                                        "Location",
                                                                        style: TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.bold),
                                                                      ),
                                                                      TextField(
                                                                        controller:
                                                                            locationController,
                                                                        decoration:
                                                                            InputDecoration(hintText: user.location),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            20,
                                                                      ),
                                                                      Text(
                                                                        "Position",
                                                                        style: TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.bold),
                                                                      ),
                                                                      TextField(
                                                                        controller:
                                                                            positionController,
                                                                        decoration:
                                                                            InputDecoration(hintText: user.position),
                                                                      ),
                                                                    ]),
                                                              ),
                                                              actions: [
                                                                TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            context),
                                                                    child: Text(
                                                                        "Cancel")),
                                                                TextButton(
                                                                  onPressed:
                                                                      () {
                                                                    updateDetails(
                                                                        userId: user
                                                                            .id,
                                                                        name: nameController.text.isEmpty
                                                                            ? user
                                                                                .name
                                                                            : nameController
                                                                                .text,
                                                                        age: ageController.text.isEmpty
                                                                            ? user
                                                                                .age
                                                                            : ageController
                                                                                .text,
                                                                        location: locationController.text.isEmpty
                                                                            ? user
                                                                                .location
                                                                            : locationController
                                                                                .text,
                                                                        position: positionController.text.isEmpty
                                                                            ? user.position
                                                                            : positionController.text);
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                  child: Text(
                                                                      "Update"),
                                                                )
                                                              ],
                                                            ));
                                              },
                                              icon: Icon(Icons.edit)),
                                          IconButton(
                                              onPressed: () {
                                                final docUser =
                                                    FirebaseFirestore.instance
                                                        .collection('Employee')
                                                        .doc('${user.id}');
                                                docUser.delete();
                                              },
                                              icon: Icon(Icons.delete))
                                        ]),
                                    Text(
                                      "Age : ${user.age}",
                                      style: TextStyle(
                                          color: Colors.orange,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "Location : ${user.location}",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "Position : ${user.position}",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            )
                          ]);
                        });
                  }),
            ),
          ]),
        ));
  }
}
