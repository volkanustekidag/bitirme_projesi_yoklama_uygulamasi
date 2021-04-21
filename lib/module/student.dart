import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yoklama/module/lesson.dart';

class Student {
  final String nameSurname, mail, department, imageUrl, UId;
  final Lesson lesson;

  Student(
    this.UId,
    this.nameSurname,
    this.mail,
    this.department,
    this.imageUrl,
    this.lesson,
  );

  Student getStudent(String getUID) {
    FirebaseFirestore.instance.collection('students').doc(getUID).get();
  }
}
