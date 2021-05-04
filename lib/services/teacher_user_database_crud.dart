import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:yoklama/module/teacher.dart';
import 'package:yoklama/services/auth.dart';

Future<void> teacherUserUpdate(var varaible) async {
  String uid = FirebaseAuth.instance.currentUser.uid;

  Teacher teacher = await teacherUserGetData();

  teacher.teacherLesson.add(varaible);

  DocumentReference studentDoc =
      FirebaseFirestore.instance.collection("teachers").doc(uid);

  studentDoc.update(teacher.toJson());

  // studentDoc
  //     .set(teacher.toJson())
  //     .whenComplete(() => null)
  //     .onError((error, stackTrace) => print("hata"));
}

Future<Teacher> teacherUserGetData() async {
  String uid = await new Authentication().getUID();
  print(uid);
  DocumentReference teacherDoc =
      FirebaseFirestore.instance.collection("teachers").doc(uid);

  var response = await teacherDoc.get();
  var veri = response.data();

  Teacher teacher = new Teacher.fromJson(veri);

  return teacher;
}
