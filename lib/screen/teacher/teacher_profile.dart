import 'package:flutter/material.dart';
import 'package:yoklama/module/teacher.dart';
import 'package:yoklama/services/teacher_user_database_crud.dart';
import 'package:yoklama/utilities/constants.dart';

class TeacherProfile extends StatefulWidget {
  @override
  _TeacherProfileState createState() => _TeacherProfileState();
}

class _TeacherProfileState extends State<TeacherProfile> {
  Teacher teacher;
  bool loading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserData().then((value) {
      setState(() {
        loading = false;
      });
    });
  }

  Future<void> getUserData() async {
    teacher = await teacherUserGetData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profil',
          style: TextStyle(fontFamily: 'OpenSans', fontWeight: FontWeight.bold),
        ),
        backgroundColor: kBlueFontToune,
      ),
      body: loading == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.20,
                  width: double.infinity,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height * 0.15,
                        width: double.infinity,
                        color: kBlueFontToune,
                      ),
                      Positioned(
                        top: 70,
                        left: 150,
                        child: Text("${teacher.teacherNameSurname}",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      ),
                      Positioned(
                        top: 95,
                        left: 150,
                        child: Text("D${teacher.teacherDepartment}",
                            style:
                                TextStyle(fontSize: 15, color: Colors.white)),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Hero(
                          tag: "ali",
                          child: Container(
                            width: 120,
                            height: 120,
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        NetworkImage(teacher.profileImageURL))),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      "${teacher.teacherNameSurname}",
                    ),
                    leading: Icon(Icons.person),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      "${teacher.teacherMail}",
                    ),
                    leading: Icon(Icons.email),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      teacher.teacherDepartment,
                    ),
                    leading: Icon(Icons.school),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      "*************",
                    ),
                    leading: Icon(Icons.lock_rounded),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: double.infinity,
                )
              ],
            ),
    );
  }
}
