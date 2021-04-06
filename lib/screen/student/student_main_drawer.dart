import 'package:flutter/material.dart';
import 'package:yoklama/screen/login_screen.dart';
import 'package:yoklama/screen/student/student_profile.dart';
import 'package:yoklama/screen/teacher/teacher_settings.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Theme.of(context).primaryColor,
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(top: 30, bottom: 5),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('images/volkan.jpg'),
                          fit: BoxFit.fill,
                        )),
                  ),
                  Text("Volkan Üstekidağ",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  Text(
                    "02170201039@inonu.edu.tr",
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
                      builder: (BuildContext context) => StudentProfile()));
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
    );
  }
}
