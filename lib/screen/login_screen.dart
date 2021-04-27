import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:yoklama/forgot_pass_view.dart';
import 'package:yoklama/register_screen.dart';
import 'package:yoklama/utilities/constants.dart';
import 'package:yoklama/utilities/widgets.dart';

import 'student/student_lessons.dart';
import 'teacher/teacher_lessons.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

GlobalKey<FormState> formKey;
GlobalKey<ScaffoldState> scaffoldKey;

class _LoginScreenState extends State<LoginScreen> {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String girisTipi = 'ÖĞRENCİ', hintText = '00000000000@ogr.inonu.edu.tr';
  String adSoyad, email, pass;

  int value = 0;

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.signOut();
    formKey = GlobalKey<FormState>();
    scaffoldKey = GlobalKey<ScaffoldState>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: LinearGradientBox,
          ),
          Container(
            height: double.infinity,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 120.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ToggleSwitch(
                    initialLabelIndex: value,
                    activeBgColor: Colors.white,
                    activeFgColor: Color(0xFF478DE0),
                    inactiveBgColor: Color(0xFF478DE0),
                    inactiveFgColor: Colors.white,
                    minWidth: 100.0,
                    labels: ['Öğrenci', 'Öğretmen'],
                    onToggle: (index) {
                      setState(() {
                        print('switched to: $index');
                        if (index == 0) {
                          girisTipi = 'ÖĞRENCİ';
                          hintText = '00000000000@ogr.inonu.edu.tr';
                          value = 0;
                        } else {
                          girisTipi = 'ÖĞRETMEN';
                          hintText = 'xxxxxxxxxxx@inonu.edu.tr';
                          value = 1;
                        }
                      });
                    },
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    girisTipi,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'OpenSans',
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Giriş Yap',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'OpenSans',
                      fontSize: 25.0,
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      children: <Widget>[
                        InputTextBox(
                          onChanged: (val) {
                            email = val;
                          },
                          boxTitle: 'Email',
                          boxIcon: Icon(
                            Icons.email,
                            color: Colors.white,
                          ),
                          textHint: hintText,
                          textInputType: TextInputType.emailAddress,
                          obscureControl: false,
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        InputTextBox(
                            onChanged: (val) {
                              pass = val;
                            },
                            boxTitle: 'Şifre',
                            boxIcon: Icon(
                              Icons.lock_rounded,
                              color: Colors.white,
                            ),
                            textHint: '**********',
                            textInputType: null,
                            obscureControl: true),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Container(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      ForgotPassView()));
                        },
                        child: Text(
                          'Şifremi unuttum.',
                          style:
                              TextStyle(fontSize: 12.00, color: Colors.white),
                        ),
                      )),
                  SizedBox(
                    height: 10.0,
                  ),
                  Button(
                    buttonName: "Giriş Yap",
                    onPress: () {
                      // _firebaseAuth.signInWithEmailAndPassword(
                      //     email: email, password: pass);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  StudentLessons()));

                      // setState(() {
                      //   if (!formKey.currentState.validate()) {
                      //     print('hata');
                      //     scaffoldKey.currentState.showSnackBar(SnackBar(
                      //       content: Text('Hatalı girişi'),
                      //     ));
                      //   } else {
                      //     if (value == 0) {
                      //       Navigator.pushReplacement(
                      //           context,
                      //           MaterialPageRoute(
                      //               builder: (BuildContext context) =>
                      //                   StudentLessons()));
                      //     } else {
                      //       Navigator.pushReplacement(
                      //           context,
                      //           MaterialPageRoute(
                      //               builder: (BuildContext context) =>
                      //                   TeacherLessons()));
                      //     }
                      //   }
                      // });
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Image(
                          image: AssetImage('images/logo.png'),
                          height: 50,
                          width: 50,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        RegisterScreen()));
                          },
                          child: Text(
                            'Kaydolmak istiyorum.',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
