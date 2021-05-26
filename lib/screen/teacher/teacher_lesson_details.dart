import 'package:flutter/material.dart';
import 'package:yoklama/module/lesson.dart';
import 'package:yoklama/screen/teacher/teacher_lesson_info.dart';
import 'package:yoklama/screen/teacher/teacher_signature.dart';
import 'package:yoklama/screen/teacher/teacher_student_list.dart';
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

  _TeacherLessonDetailsState(this.lesson);

  List<Widget> widgetOptions() {
    return [
      TeacherNotification(
        lesson: lesson,
      ),
      TeacherSList(lesson: lesson),
      TeacherSignature(lesson: lesson)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetOptions()[bottomBarCurrentIndex],
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
                icon: Icon(Icons.notifications), title: Text('Duyuru')),
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
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TeacherLessonInfo(
                                lesson: lesson,
                              )));
                },
                child: Icon(Icons.info)),
          ],
        ),
      )),
    );
  }
}
