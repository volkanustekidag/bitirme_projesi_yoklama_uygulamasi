import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:yoklama/module/teacher.dart';
import 'package:yoklama/services/auth.dart';

Future<void> teacherCreat(Teacher teacher) async {
  teacher.teachertUID = await new Authentication().getUID();
  teacher.profileImageURL = await new Authentication().getUserProfileImageURL();
  teacher.teacherLesson = [];

  DocumentReference documentReference = FirebaseFirestore.instance
      .collection("teachers")
      .doc(teacher.teachertUID);

  documentReference.set(teacher.toJson());
}

Future<void> teacherUserUpdate(var varaible) async {
  String uid = FirebaseAuth.instance.currentUser.uid;

  Teacher teacher = await teacherUserGetData();

  teacher.teacherLesson.add(varaible);

  DocumentReference studentDoc =
      FirebaseFirestore.instance.collection("teachers").doc(uid);

  studentDoc.update(teacher.toJson());
}

Future<Teacher> teacherUserGetData() async {
  String uid = await new Authentication().getUID();
  print(uid);
  DocumentReference teacherDoc =
      FirebaseFirestore.instance.collection("teachers").doc(uid);

  var response = await teacherDoc.get();
  var data = response.data();

  Teacher teacher = new Teacher.fromJson(data);

  return teacher;
}

Future<Teacher> teacherUserGetDatas(String id) async {
  DocumentReference teacherDoc =
      FirebaseFirestore.instance.collection("teachers").doc(id);

  var response = await teacherDoc.get();
  var data = response.data();

  Teacher teacher = new Teacher.fromJson(data);

  return teacher;
}
