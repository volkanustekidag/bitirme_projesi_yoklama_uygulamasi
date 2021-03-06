import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:yoklama/module/student.dart';
import 'package:yoklama/screen/login_screen.dart';
import 'package:yoklama/screen/student/student_profile.dart';
import 'package:yoklama/screen/teacher/teacher_settings.dart';

class MainDrawer extends StatelessWidget {
  Student student;

  MainDrawer(this.student);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(35), bottomRight: Radius.circular(35)),
      child: Drawer(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(30),
              color: Theme.of(context).primaryColor,
              child: Center(
                child: Column(
                  children: <Widget>[
                    Hero(
                      tag: "volkan",
                      child: CircleAvatar(
                          radius: 50,
                          backgroundImage:
                              NetworkImage("${student.studentImageUrl}")),
                    ),
                    Text("${student.studentNameSurname}",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    Text(
                      "${student.studentMail}",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    )
                  ],
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => StudentProfile(
                              student: student,
                            )));
              },
              leading: Icon(Icons.person),
              title: Text(
                "Profil",
                style: TextStyle(fontSize: 15),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => TeacherSettings()));
              },
              leading: Icon(Icons.settings),
              title: Text(
                "Ayarlar",
                style: TextStyle(fontSize: 15),
              ),
            ),
            ListTile(
              onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => LoginScreen()));
              },
              leading: Icon(Icons.exit_to_app),
              title: Text(
                "Çıkış",
                style: TextStyle(fontSize: 15),
              ),
            )
          ],
        ),
      ),
    );
  }
}
