import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:yoklama/register_screen.dart';

import 'student/student_lessons.dart';
import 'teacher/teacher_lessons.dart';

class Yoklama extends StatefulWidget {
  @override
  _YoklamaState createState() => _YoklamaState();
}

final formKey = GlobalKey<FormState>();
final scaffoldKey = GlobalKey<ScaffoldState>();

class _YoklamaState extends State<Yoklama> {
  @override
  void dispose() {
    super.dispose();
  }

  String girisTipi = 'ÖĞRENCİ', hintText = '00000000000@ogr.inonu.edu.tr';

  int value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
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
                  Form(
                    key: formKey,
                    child: Column(
                      children: <Widget>[
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
                      ],
                    ),
                  ),
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
                          if (!formKey.currentState.validate()) {
                            print('hata');
                            scaffoldKey.currentState.showSnackBar(SnackBar(
                              content: Text('Hatalı girişi'),
                            ));
                          } else {
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
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Icon(Icons.account_circle_rounded, color: Colors.white),
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

// ignore: camel_case_types
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
          child: TextFormField(
            validator: obscureControl
                ? MultiValidator([
                    MinLengthValidator(10, errorText: ''),
                  ])
                : MultiValidator([
                    MinLengthValidator(10,
                        errorText: 'En az 10 karakter girmelisin.'),
                    EmailValidator(
                        errorText: 'Geçerli bir email adresi giriniz.')
                  ]),
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
