import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:yoklama/forgot_pass_view.dart';
import 'package:yoklama/register_screen.dart';
import 'package:yoklama/services/auth.dart';
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
  String girisTipi = 'ÖĞRENCİ', hintText = '00000000000@ogr.inonu.edu.tr';
  String adSoyad, email, pass;

  Authentication auth = new Authentication();

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
          Background(),
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
                        EmailInputTextBox(auth: auth, hintText: hintText),
                        SizedBox(
                          height: 30.0,
                        ),
                        PassInputTextBox(auth: auth),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  ForgotPassContanier(),
                  SizedBox(
                    height: 10.0,
                  ),
                  Button(
                    buttonName: "Giriş Yap",
                    onPress: () {
                      setState(() {
                        if (!formKey.currentState.validate()) {
                          print('hata');
                          scaffoldKey.currentState.showSnackBar(SnackBar(
                            content: Text('Hatalı girişi'),
                          ));
                        } else {
                          if (value == 0) {
                            auth.signIn().then((value) =>
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            StudentLessons())));
                          } else {
                            auth.signIn().then((value) =>
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            TeacherLessons())));
                          }
                        }
                      });
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RegisterTextContanier(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Background extends StatelessWidget {
  const Background({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: linearGradientBox,
    );
  }
}

class EmailInputTextBox extends StatelessWidget {
  const EmailInputTextBox({
    Key key,
    @required this.auth,
    @required this.hintText,
  }) : super(key: key);

  final Authentication auth;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return InputTextBox(
      onChanged: (val) {
        auth.email = val;
      },
      boxIcon: Icon(
        Icons.email,
        color: Colors.white,
      ),
      textHint: hintText,
      textInputType: TextInputType.emailAddress,
      obscureControl: false,
    );
  }
}

class PassInputTextBox extends StatelessWidget {
  const PassInputTextBox({
    Key key,
    @required this.auth,
  }) : super(key: key);

  final Authentication auth;

  @override
  Widget build(BuildContext context) {
    return InputTextBox(
        onChanged: (val) {
          auth.pass = val;
        },
        boxIcon: Icon(
          Icons.lock_rounded,
          color: Colors.white,
        ),
        textHint: '**********',
        textInputType: null,
        obscureControl: true);
  }
}

class ForgotPassContanier extends StatelessWidget {
  const ForgotPassContanier({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.centerRight,
        child: TextButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => ForgotPassView()));
          },
          child: Text(
            'Şifremi unuttum.',
            style: TextStyle(fontSize: 12.00, color: Colors.white),
          ),
        ));
  }
}

class RegisterTextContanier extends StatelessWidget {
  const RegisterTextContanier({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                      builder: (BuildContext context) => RegisterScreen()));
            },
            child: Text(
              'Kaydolmak istiyorum.',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
