import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yoklama/module/lesson.dart';
import 'package:yoklama/services/auth.dart';
import 'package:yoklama/services/teacher_user_database_crud.dart';

Future<void> createLesson(Lesson lesson) async {
  Random rand = new Random();
  int random = rand.nextInt(20);
  String uid = await new Authentication().getUID();
  String lessonId =
      uid.substring(random, random + 6) + lesson.lessonName.substring(0, 3);

  lesson.notifications = [];
  lesson.students = [];
  lesson.lessonId = lessonId;
  DocumentReference lessonDoc =
      FirebaseFirestore.instance.collection("lessons").doc(lessonId);

  lessonDoc
      .set(lesson.toJson())
      .whenComplete(() => null)
      .onError((error, stackTrace) => print("hata"));

  teacherUserUpdate(lessonId);
}

Future<Lesson> getLesson(String lessonId) async {
  DocumentReference lessonRef =
      FirebaseFirestore.instance.collection("lessons").doc(lessonId);

  var doc = await lessonRef.get();
  var response = doc.data();

  Lesson lesson = Lesson.fromJson(response);

  return lesson;
}

Future<void> updateLesson(Lesson lesson) async {
  DocumentReference lessonRef =
      FirebaseFirestore.instance.collection("lessons").doc(lesson.lessonId);

  lessonRef.update(lesson.toJson());
}
