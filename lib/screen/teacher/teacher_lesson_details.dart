import 'package:flutter/material.dart';
import 'package:yoklama/module/lesson.dart';
import 'package:yoklama/screen/teacher/teacher_signature.dart';
import 'package:yoklama/screen/teacher/teacher_student.dart';
import 'package:yoklama/utilities/constants.dart';
import 'teacher_notification.dart';

class TeacherLessonDetails extends StatefulWidget {
  final Lesson lesson;

  TeacherLessonDetails(this.lesson);

  @override
  _TeacherLessonDetailsState createState() =>
      _TeacherLessonDetailsState(lesson);
}

class _TeacherLessonDetailsState extends State<TeacherLessonDetails> {
  final Lesson lesson;

  int bottomBarCurrentIndex = 0;

  List<Widget> widgetOptions = [
    TeacherNotification(),
    TeacherStudent(),
    TeacherSignature()
  ];

  _TeacherLessonDetailsState(this.lesson);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetOptions[bottomBarCurrentIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              bottomBarCurrentIndex = index;
            });
          },
          iconSize: 32,
          currentIndex: bottomBarCurrentIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.alarm), title: Text('Duyuru')),
            BottomNavigationBarItem(
                icon: Icon(Icons.group), title: Text('Öğrenciler')),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_pin), title: Text('Yoklama')),
          ]),
      appBar: AppBar(
          title: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              lesson.lessonName,
              style: kAppBarTextStyle,
            ),
            Icon(Icons.settings),
          ],
        ),
      )),
    );
  }
}
