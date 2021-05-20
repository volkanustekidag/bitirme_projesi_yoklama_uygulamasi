import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yoklama/module/teacher.dart';
import 'package:yoklama/screen/login_screen.dart';
import 'package:yoklama/screen/teacher/teacher_profile.dart';
import 'package:yoklama/screen/teacher/teacher_settings.dart';
import 'package:yoklama/services/teacher_user_database_crud.dart';

class MainDrawer extends StatefulWidget {
  final Teacher teacher;

  const MainDrawer({Key key, this.teacher}) : super(key: key);
  @override
  _MainDrawerState createState() => _MainDrawerState(teacher);
}

class _MainDrawerState extends State<MainDrawer> {
  final Teacher teacher;

  _MainDrawerState(this.teacher);

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
                      tag: "ali",
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage:
                            NetworkImage('${teacher.profileImageURL}'),
                      ),
                    ),
                    Text("${teacher.teacherNameSurname}",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    Text(
                      "${teacher.teacherMail}",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    )
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => TeacherProfile()));
              },
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
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (BuildContext context) => LoginScreen()),
                );
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
