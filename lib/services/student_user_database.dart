import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yoklama/module/student.dart';

class StudentUserDatabase {
  Student getStudent(String getUID) {
    FirebaseFirestore.instance.collection('students').doc(getUID).get();
  }
}
