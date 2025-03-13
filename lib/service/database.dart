import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notes/pages/form.dart';
import 'package:notes/pages/task.dart';

Future addDetails(
    {required String name,
    required String age,
    required String location,
    required String position,
    required String task}) async {
  final docUser = FirebaseFirestore.instance.collection("Employee").doc();
  final json = {
    'id': docUser.id,
    'name': name,
    'age': age,
    'location': location,
    'position': position,
    'task': task,
  };

  await docUser.set(json);
}

Future addTask(
    {required String taskName,
    required String taskDesc,
    required DateTime selectDate}) async {
  final docUser = FirebaseFirestore.instance.collection("Task").doc();
  final json = {
    'taskName': taskName,
    'selectDate': selectDate,
    'taskDesc': taskDesc
  };
  await docUser.set(json);
}

Future updateDetails(
    {required String userId,
    required String name,
    required String age,
    required String location,
    required String position,
    required String task}) async {
  final docUser = FirebaseFirestore.instance.collection("Employee").doc(userId);

  await docUser.update({
    'name': name,
    'age': age,
    'location': location,
    'position': position,
    'taks': task
  });
}

Stream<List<User>> readUser() => FirebaseFirestore.instance
    .collection("Employee")
    .snapshots()
    .map((snapshot) =>
        snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());

Stream<List<Task>> readTask() =>
    FirebaseFirestore.instance.collection("Task").snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Task.fromJson(doc.data())).toList());


