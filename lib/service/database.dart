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

class User {}

// Stream<List<User>> readDetails(dynamic doc) => FirebaseFirestore.instance
//     .collection("Employee")
//     .snapshots()
//     .map((snapshot)=>
//         snapshot.docs.map((doc)=>)doc.data().toList());
