import 'package:flutter/material.dart';
import 'package:yoklama/screen/login_screen.dart';
import 'package:yoklama/screen/student/student_profile.dart';
import 'package:yoklama/screen/teacher/teacher_settings.dart';

class MainDrawer extends StatelessWidget {
  final file = NetworkImage(
      "https://firebasestorage.googleapis.com/v0/b/yoklama-df3e9.appspot.com/o/data%2Fuser%2F0%2Fcom.example.bitirme_projesi_yoklama_uygulamasi%2Fcache%2Fimage_picker1141978280799298666.jpg?alt=media&token=41840038-de91-467c-ab6c-f4c7891400a8");

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
              padding: EdgeInsets.all(20),
              color: Theme.of(context).primaryColor,
              child: Center(
                child: Column(
                  children: <Widget>[
                    Hero(
                      tag: "volkan",
                      child: CircleAvatar(radius: 50, backgroundImage: file),
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
      ),
    );
  }
}
