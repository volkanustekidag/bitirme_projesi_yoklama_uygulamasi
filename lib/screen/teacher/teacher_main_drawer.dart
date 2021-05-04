import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yoklama/screen/login_screen.dart';
import 'package:yoklama/screen/teacher/teacher_profile.dart';
import 'package:yoklama/screen/teacher/teacher_settings.dart';

class MainDrawer extends StatelessWidget {
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
                        backgroundImage: NetworkImage(
                            'https://firebasestorage.googleapis.com/v0/b/yoklama-df3e9.appspot.com/o/usersprofilephoto%2FJAjQaTdSWqOcT7yHyrHjePZ3ezZ2?alt=media&token=e904e02d-d548-4ea1-a27d-33471647c907'),
                      ),
                    ),
                    Text("Ali ARI",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    Text(
                      "ali.ari@inonu.edu.tr",
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
