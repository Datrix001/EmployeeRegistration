import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notes/pages/form.dart';

Future addDetails(
    {required String name,
    required String age,
    required String location, required String position}) async {
  final docUser = FirebaseFirestore.instance.collection("Employee").doc();
  final json = {
    'id': docUser.id,
    'name': name,
    'age': age,
    'location': location,
    'position':position
  };

  await docUser.set(json);
}

Future updateDetails(
  {required String userId,
    required String name,
    required String age,
    required String location,
    required String position, required String task}) async {
  final docUser = FirebaseFirestore.instance.collection("Employee").doc(userId);

  await docUser.update({
    'name': name,
    'age': age,
    'location': location,
    'position':position
  });
}

Stream<List<User>> readUser() => FirebaseFirestore.instance
    .collection("Employee")
    .snapshots()
    .map((snapshot) =>
        snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());
