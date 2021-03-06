import 'package:flutter/material.dart';
import 'package:yoklama/module/lesson.dart';
import 'package:yoklama/screen/student/student_notification.dart';
import 'package:yoklama/screen/student/student_signatures.dart';
import 'package:yoklama/screen/student/student_student_list.dart';

class StudentLessonDetails extends StatefulWidget {
  final Lesson lesson;

  const StudentLessonDetails({Key key, this.lesson}) : super(key: key);
  @override
  _StudentLessonDetailsState createState() =>
      _StudentLessonDetailsState(lesson);
}

int bottomBarCurrentIndex = 0;

class _StudentLessonDetailsState extends State<StudentLessonDetails> {
  List<Widget> widgetOptions() {
    return [
      StudentNotification(
        lesson: lesson,
      ),
      StudenTSList(lesson: lesson),
      StudentSignatures(
        lesson: lesson,
      )
    ];
  }

  final Lesson lesson;

  _StudentLessonDetailsState(this.lesson);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${lesson.lessonName}"),
      ),
      body: widgetOptions()[bottomBarCurrentIndex],
      bottomNavigationBar: BottomNavBar(
        onTap: (index) {
          setState(() {
            bottomBarCurrentIndex = index;
          });
        },
      ),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key key,
    this.onTap,
  }) : super(key: key);

  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        onTap: onTap,
        iconSize: 32,
        currentIndex: bottomBarCurrentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), title: Text('Duyuru')),
          BottomNavigationBarItem(
              icon: Icon(Icons.group), title: Text('Öğrenciler')),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_pin), title: Text('Yoklama')),
        ]);
  }
}
