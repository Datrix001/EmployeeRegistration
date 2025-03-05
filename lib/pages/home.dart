import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notes/pages/form.dart';
import 'package:notes/service/database.dart';

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
        floatingActionButton: FloatingActionButton(
            onPressed: () => Navigator.pushNamed(context, "/form"),
            child: Icon(Icons.add)),
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Flutter",
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold),
              ),
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
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
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
                                                builder: (context) =>
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
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                              TextField(
                                                                controller:
                                                                    nameController,
                                                                decoration:
                                                                    InputDecoration(
                                                                        hintText:
                                                                            user.name),
                                                              ),
                                                              SizedBox(
                                                                height: 20,
                                                              ),
                                                              Text(
                                                                "Age",
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                              TextField(
                                                                controller:
                                                                    ageController,
                                                                decoration:
                                                                    InputDecoration(
                                                                        hintText:
                                                                            user.age),
                                                              ),
                                                              SizedBox(
                                                                height: 20,
                                                              ),
                                                              Text(
                                                                "Location",
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                              TextField(
                                                                controller:
                                                                    locationController,
                                                                decoration:
                                                                    InputDecoration(
                                                                        hintText:
                                                                            user.location),
                                                              ),
                                                              SizedBox(
                                                                height: 20,
                                                              ),
                                                              Text(
                                                                "Position",
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                              TextField(
                                                                controller:
                                                                    positionController,
                                                                decoration:
                                                                    InputDecoration(
                                                                        hintText:
                                                                            user.position),
                                                              ),
                                                            ]),
                                                      ),
                                                      actions: [
                                                        TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    context),
                                                            child:
                                                                Text("Cancel")),
                                                        TextButton(
                                                          onPressed: () {
                                                            updateDetails(
                                                                userId: user.id,
                                                                name: nameController
                                                                        .text
                                                                        .isEmpty
                                                                    ? user.name
                                                                    : nameController
                                                                        .text,
                                                                age: ageController
                                                                        .text
                                                                        .isEmpty
                                                                    ? user.age
                                                                    : ageController
                                                                        .text,
                                                                location: locationController
                                                                        .text
                                                                        .isEmpty
                                                                    ? user
                                                                        .location
                                                                    : locationController
                                                                        .text,
                                                                position: positionController
                                                                        .text
                                                                        .isEmpty
                                                                    ? user
                                                                        .position
                                                                    : positionController
                                                                        .text);
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Text("Update"),
                                                        )
                                                      ],
                                                    ));
                                          },
                                          icon: Icon(Icons.edit)),
                                      IconButton(
                                          onPressed: () {
                                            final docUser = FirebaseFirestore
                                                .instance
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
        ));
  }
}
