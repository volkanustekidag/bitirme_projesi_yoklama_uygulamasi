import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:yoklama/screen/student/student_lessons.dart';
import 'package:yoklama/screen/teacher/teacher_lessons.dart';

class Yoklama extends StatefulWidget {
  @override
  _YoklamaState createState() => _YoklamaState();
}

class _YoklamaState extends State<Yoklama> {
  String girisTipi = 'ÖĞRENCİ', hintText = '00000000000@ogr.inonu.edu.tr';

  int value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
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
                  textBox(
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
                  textBox(
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
                  Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Şifremi unuttum.',
                        style: TextStyle(fontSize: 12.00, color: Colors.white),
                      )),
                  SizedBox(
                    height: 15.0,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 25.0),
                    width: double.infinity,
                    child: RaisedButton(
                      onPressed: () {
                        setState(() {
                          if (value == 0) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        Student_Lessons()));
                          } else {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        Teacher_Lessons()));
                          }
                        });
                      },
                      elevation: 5.0,
                      padding: EdgeInsets.all(15.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      color: Colors.white,
                      child: Text(
                        'GİRİŞ YAP',
                        style: TextStyle(
                          color: Color(0xFF478DE0),
                          fontFamily: 'OpenSans',
                          fontSize: 20.00,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class textBox extends StatelessWidget {
  final String boxTitle;
  final Icon boxIcon;
  final String textHint;
  final TextInputType textInputType;
  final bool obscureControl;

  const textBox(
      {@required this.boxTitle,
      @required this.boxIcon,
      @required this.textHint,
      @required this.textInputType,
      @required this.obscureControl});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          boxTitle,
          style: TextStyle(
              fontSize: 15.0, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 8.0,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xFF478DE0),
          ),
          height: 60.0,
          child: TextField(
            obscureText: obscureControl,
            keyboardType: textInputType,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: boxIcon,
                hintText: textHint,
                hintStyle: TextStyle(
                  color: Colors.white,
                )),
          ),
        ),
      ],
    );
  }
}
