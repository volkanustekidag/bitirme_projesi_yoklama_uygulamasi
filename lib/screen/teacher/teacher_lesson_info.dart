import 'package:flutter/material.dart';
import 'package:yoklama/module/lesson.dart';

class TeacherLessonInfo extends StatefulWidget {
  final Lesson lesson;

  const TeacherLessonInfo({Key key, this.lesson}) : super(key: key);
  @override
  _TeacherLessonInfoState createState() => _TeacherLessonInfoState(lesson);
}

class _TeacherLessonInfoState extends State<TeacherLessonInfo> {
  final Lesson lesson;

  _TeacherLessonInfoState(this.lesson);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${lesson.lessonName} Bilgi"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Card(
              child: ListTile(
                leading: Text("Ders Adı"),
                trailing: Text("${lesson.lessonName}"),
              ),
            ),
            Card(
              child: ListTile(
                leading: Text("Ders Hakkında"),
                trailing: Text("${lesson.comment}"),
              ),
            ),
            Card(
              child: ListTile(
                leading: Text("Bölüm"),
                trailing: Text("${lesson.departmentName}"),
              ),
            ),
            Card(
              child: ListTile(
                leading: Text("Öğrenci Sayısı"),
                trailing: Text("${lesson.students.length}"),
              ),
            ),
            Card(
              child: ListTile(
                leading: Text("Ders Katılım Kodu"),
                trailing: Text("${lesson.lessonId}"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
