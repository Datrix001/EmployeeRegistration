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
                                      Text(
                                        "Name : ${user.name}",
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Spacer(),
                                      IconButton(
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    AlertDialog(
                                                      title: Text("Edit"),
                                                      content:
                                                          SingleChildScrollView(
                                                        child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min, // ✅ Ensures dialog size adapts to content
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text("Name"),
                                                              TextField(
                                                                controller:
                                                                    nameController,
                                                              ),
                                                              Text("Age"),
                                                              TextField(
                                                                controller:
                                                                    ageController,
                                                              ),
                                                              Text("Location"),
                                                              TextField(
                                                                controller:
                                                                    locationController,
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
                                                          onPressed: () async {
                                                            String updatedName =
                                                                nameController
                                                                    .text;
                                                            String updatedAge =
                                                                ageController
                                                                    .text;
                                                            String
                                                                updatedLocation =
                                                                locationController
                                                                    .text;
                                                            final docUser =
                                                                FirebaseFirestore
                                                                    .instance
                                                                    .collection(
                                                                        'Employee')
                                                                    .doc(
                                                                        '${user.id}');
                                                            await docUser
                                                                .update({
                                                              'name':
                                                                  updatedName,
                                                              'age': updatedAge,
                                                              'location':
                                                                  updatedLocation,
                                                            });
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
