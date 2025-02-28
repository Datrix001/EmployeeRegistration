import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notes/pages/form.dart';

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

Stream<List<User>> readUser() => FirebaseFirestore.instance
    .collection("Employee")
    .snapshots()
    .map((snapshot) =>
        snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());
