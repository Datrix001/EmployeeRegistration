import 'package:cloud_firestore/cloud_firestore.dart';


class Database {
  Future addEmployeeDetails(
      Map<String, dynamic> employeeInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("Employee")
        .doc(id)
        .set(employeeInfoMap);
  }

  Stream<QuerySnapshot> getEmployeeStream(){
    return FirebaseFirestore.instance.collection("Employee").snapshots();
  }

  static Stream<QuerySnapshot> getEmplyeeDetails() {
    return FirebaseFirestore.instance.collection("Employee").snapshots();
  }
}
