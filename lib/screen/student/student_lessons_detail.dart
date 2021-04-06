import 'package:flutter/material.dart';
import 'package:yoklama/screen/student/student_notification.dart';
import 'package:yoklama/screen/student/student_signatures.dart';
import 'package:yoklama/screen/student/student_student_list.dart';
import 'package:yoklama/screen/teacher/teacher_notification.dart';

class StudentLessonDetails extends StatefulWidget {
  @override
  _StudentLessonDetailsState createState() => _StudentLessonDetailsState();
}

int bottomBarCurrentIndex = 0;
List<Widget> widgetOptions = [
  StudentNotification(),
  StudentStundetList(),
  StudentSignatures()
];

class _StudentLessonDetailsState extends State<StudentLessonDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bitirme Projesi"),
      ),
      body: widgetOptions[bottomBarCurrentIndex],
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
              icon: Icon(Icons.alarm), title: Text('Duyuru')),
          BottomNavigationBarItem(
              icon: Icon(Icons.group), title: Text('Öğrenciler')),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_pin), title: Text('Yoklama')),
        ]);
  }
}
