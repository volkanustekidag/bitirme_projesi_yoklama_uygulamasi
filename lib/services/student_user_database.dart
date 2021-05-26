import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yoklama/module/student.dart';
import 'package:yoklama/services/auth.dart';

Future<void> createStudentUser(Student student) async {
  student.studentUID = await new Authentication().getUID();
  student.studentImageUrl = await new Authentication().getUserProfileImageURL();
  student.studentLesson = [];

  DocumentReference studentDoc =
      FirebaseFirestore.instance.collection("students").doc(student.studentUID);

  studentDoc
      .set(student.toJson())
      .whenComplete(() => null)
      .onError((error, stackTrace) => print("hata"));
}

Future<Student> getStudentUser(String uid) async {
  DocumentReference documentReference =
      FirebaseFirestore.instance.collection("students").doc(uid);

  var response = await documentReference.get();
  var data = response.data();

  Student student = Student.fromJson(data);

  return student;
}

Future<void> updateStudentUser(Student student) async {
  DocumentReference documentReference =
      FirebaseFirestore.instance.collection("students").doc(student.studentUID);

  documentReference
      .update(student.toJson())
      .onError((error, stackTrace) => print(error.toString()));
}
