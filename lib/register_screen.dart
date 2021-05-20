import 'package:flutter/material.dart';
import 'package:yoklama/forgot_pass_view.dart';
import 'package:yoklama/module/student.dart';
import 'package:yoklama/module/teacher.dart';
import 'package:yoklama/screen/student/student_%20new_users.dart';
import 'package:yoklama/screen/teacher/teacher_new_user_details.dart';
import 'package:yoklama/services/auth.dart';
import 'package:yoklama/utilities/constants.dart';
import 'package:yoklama/utilities/widgets.dart';
import 'package:firebase_core/firebase_core.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  Authentication authentication = Authentication();
  String userTypeItemValue;

  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Background(),
          Container(
            height: double.infinity,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: 30.0,
                vertical: 50.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RegisterScreenTextTitle(),
                  SizedBox(
                    height: 15,
                  ),
                  NameSurnameInputTextBox(authentication: authentication),
                  SizedBox(
                    height: 15.0,
                  ),
                  EmailInputTextBox(authentication: authentication),
                  SizedBox(
                    height: 15.0,
                  ),
                  PassInputTextBox(authentication: authentication),
                  SizedBox(
                    height: 15.0,
                  ),
                  AgainPassInputTextBox(),
                  SizedBox(
                    height: 15.0,
                  ),
                  SelecetionUserTypeDropdownButton(
                      onChanged: (value) {
                        setState(() {
                          userTypeItemValue = value;
                        });
                      },
                      menuItemValue: userTypeItemValue),
                  SizedBox(
                    height: 10.0,
                  ),
                  RegisterButton(
                      menuItemValue: userTypeItemValue, auth: authentication),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Zaten Bir hesabım var. ",
                          style: TextStyle(color: Colors.white),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text('Giriş Yap!',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              )),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
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
      width: double.infinity,
      height: double.infinity,
      decoration: linearGradientBox,
    );
  }
}

class RegisterScreenTextTitle extends StatelessWidget {
  const RegisterScreenTextTitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Kaydol",
      style: TextStyle(
        color: Colors.white,
        fontFamily: 'OpenSans',
        fontSize: 25.0,
      ),
    );
  }
}

class NameSurnameInputTextBox extends StatelessWidget {
  const NameSurnameInputTextBox({
    Key key,
    @required this.authentication,
  }) : super(key: key);

  final Authentication authentication;

  @override
  Widget build(BuildContext context) {
    return InputTextBox(
        onChanged: (val) {
          authentication.nameSurname = val;
        },
        boxIcon: Icon(
          Icons.account_box_rounded,
          color: Colors.white,
        ),
        textHint: "Ad Soyad",
        textInputType: null,
        obscureControl: false);
  }
}

class EmailInputTextBox extends StatelessWidget {
  const EmailInputTextBox({
    Key key,
    @required this.authentication,
  }) : super(key: key);

  final Authentication authentication;

  @override
  Widget build(BuildContext context) {
    return InputTextBox(
      onChanged: (val) {
        authentication.email = val;
      },
      boxIcon: Icon(
        Icons.email,
        color: Colors.white,
      ),
      textHint: "E-mail",
      textInputType: TextInputType.emailAddress,
      obscureControl: false,
    );
  }
}

class PassInputTextBox extends StatelessWidget {
  const PassInputTextBox({
    Key key,
    @required this.authentication,
  }) : super(key: key);

  final Authentication authentication;

  @override
  Widget build(BuildContext context) {
    return InputTextBox(
        onChanged: (val) {
          authentication.pass = val;
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

class AgainPassInputTextBox extends StatelessWidget {
  const AgainPassInputTextBox({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InputTextBox(
        onChanged: (val) {},
        boxIcon: Icon(
          Icons.lock_rounded,
          color: Colors.white,
        ),
        textHint: '**********',
        textInputType: null,
        obscureControl: true);
  }
}

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    Key key,
    @required this.menuItemValue,
    @required this.auth,
  }) : super(key: key);

  final String menuItemValue;
  final Authentication auth;

  @override
  Widget build(BuildContext context) {
    return Button(
      buttonName: "KAYDOL",
      onPress: () {
        if (menuItemValue.contains('Öğrenci')) {
          auth.registerUser('students');
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => StundentNewUsers(
                        student: new Student(
                            studentNameSurname: auth.nameSurname,
                            studentMail: auth.email),
                      )));
        } else {
          auth
              .registerUser('teachers')
              .then((value) => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TeacherNewUserDetails(
                            teacher: new Teacher(
                              teacherNameSurname: auth.nameSurname,
                              teacherMail: auth.email,
                            ),
                          ))));
        }
      },
    );
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
