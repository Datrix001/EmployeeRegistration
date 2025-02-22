import 'package:cloud_firestore/cloud_firestore.dart';

Future addDetails(
    {required String name,
    required String age,
    required String location}) async {
  final docUser = FirebaseFirestore.instance.collection("Employee").doc();
  final json = {
    'id': docUser.id,
    'name': name,
    'age': age,
    'location': location,
  };

  await docUser.set(json);
}

Stream<List<User>> readDetails() => FirebaseFirestore.instance
    .collection("Employee")
    .snapshots()
     .snapshot.docs.map((doc) => User.fromFirestore(doc)).toList();
