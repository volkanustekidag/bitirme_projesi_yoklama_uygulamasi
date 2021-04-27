import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:yoklama/module/student.dart';
import 'package:yoklama/module/teacher.dart';
import 'package:yoklama/screen/student/student_%20new_users.dart';
import 'package:yoklama/screen/student/student_lessons.dart';
import 'package:yoklama/screen/teacher/teacher_new_user_details.dart';
import 'package:yoklama/utilities/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  String menuItemValue;

  String adSoyad, email, pass;

  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Color(0xFF73AEF5),
                  Color(0xFF61A4F1),
                  Color(0xFF478DE0),
                  Color(0xFF398AE5),
                ],
                    stops: [
                  0.1,
                  0.4,
                  0.7,
                  0.9,
                ])),
          ),
          Container(
            height: double.infinity,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: 30.0,
                vertical: 40.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        )),
                  ),
                  Text(
                    "Kaydol",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'OpenSans',
                      fontSize: 25.0,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  InputTextBox(
                      onChanged: (val) {
                        setState(() {
                          adSoyad = val;
                        });
                      },
                      boxTitle: "Ad Soyad",
                      boxIcon: Icon(
                        Icons.account_box_rounded,
                        color: Colors.white,
                      ),
                      textHint: "Ad Soyad",
                      textInputType: null,
                      obscureControl: false),
                  SizedBox(
                    height: 15.0,
                  ),
                  InputTextBox(
                    onChanged: (val) {
                      email = val;
                    },
                    boxTitle: 'Email',
                    boxIcon: Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                    textHint: "E-mail",
                    textInputType: TextInputType.emailAddress,
                    obscureControl: false,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  InputTextBox(
                      onChanged: (val) {
                        setState(() {
                          pass = val;
                        });
                      },
                      boxTitle: 'Şifre',
                      boxIcon: Icon(
                        Icons.lock_rounded,
                        color: Colors.white,
                      ),
                      textHint: '**********',
                      textInputType: null,
                      obscureControl: true),
                  SizedBox(
                    height: 15.0,
                  ),
                  InputTextBox(
                      onChanged: (val) {},
                      boxTitle: 'Tekrar Şifre',
                      boxIcon: Icon(
                        Icons.lock_rounded,
                        color: Colors.white,
                      ),
                      textHint: '**********',
                      textInputType: null,
                      obscureControl: true),
                  SizedBox(
                    height: 15.0,
                  ),
                  SelecetionUserTypeDropdownButton(
                      onChanged: (value) {
                        setState(() {
                          menuItemValue = value;
                        });
                      },
                      menuItemValue: menuItemValue),
                  SizedBox(
                    height: 10.0,
                  ),
                  Button(
                    buttonName: "KAYDOL",
                    onPress: () {
                      if (menuItemValue.contains('Öğrenci')) {
                        registerStundetUser();
                      } else {
                        registerTeacherUser();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> registerTeacherUser() async {
    Firebase.initializeApp();

    _firebaseAuth.createUserWithEmailAndPassword(email: email, password: pass);

    print(FirebaseAuth.instance.currentUser.uid.toString());

    String teacherUID = FirebaseAuth.instance.currentUser.uid.toString();

    Teacher teacher = new Teacher(teacherUID, adSoyad, email, "", "", null);

    DocumentReference firebaseFirestore =
        FirebaseFirestore.instance.collection("teachers").doc(teacherUID);

    firebaseFirestore
        .set({
          'uid': teacher.teacherId,
          'ad_soyad': teacher.teacherNameSurname,
          'email': email,
        })
        .then((value) => print("user added"))
        .catchError((error) => print("failed"));

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => TeacherNewUserDetails(teacher: teacher)));
    return;
  }

  Future<void> registerStundetUser() async {
    Firebase.initializeApp();
    _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: pass)
        .then((value) => null);

    String studentUID = FirebaseAuth.instance.currentUser.uid.toString();

    Student student = new Student(studentUID, adSoyad, email, "", "", null);

    DocumentReference firebaseFirestore =
        FirebaseFirestore.instance.collection('students').doc(studentUID);

    firebaseFirestore
        .set({
          'uid': studentUID,
          'ad_soyad': adSoyad,
          'email': email,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => StundentNewUsers(
                  student: student,
                )));
    return;
  }
}

class SelecetionUserTypeDropdownButton extends StatelessWidget {
  const SelecetionUserTypeDropdownButton({
    Key key,
    @required this.menuItemValue,
    this.onChanged,
  }) : super(key: key);

  final String menuItemValue;
  final Function onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xFF478DE0),
      ),
      child: DropdownButton<String>(
        dropdownColor: Color(0xFF478DE0),
        isExpanded: true,
        icon: Icon(
          Icons.arrow_drop_down,
          color: Colors.white,
        ),
        value: menuItemValue,
        hint: Text(
          "Üye tipi seçiniz.",
          style: TextStyle(color: Colors.white),
        ),
        onChanged: onChanged,
        items: [
          DropdownMenuItem(
            child: Text(
              "Öğrenci",
              style: TextStyle(color: Colors.white),
            ),
            value: 'Öğrenci',
          ),
          DropdownMenuItem(
              child: Text(
                "Öğretmen",
                style: TextStyle(color: Colors.white),
              ),
              value: 'Öğretmen')
        ],
      ),
    );
  }
}
