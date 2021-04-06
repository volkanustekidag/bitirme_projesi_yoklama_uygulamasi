import 'package:flutter/material.dart';
import 'package:yoklama/screen/teacher/teacher_new_user_details.dart';
import 'package:yoklama/utilities/widgets.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  int menuItemValue;
  String adSoyad;

  @override
  Widget build(BuildContext context) {
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
                    boxTitle: 'Email',
                    boxIcon: Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                    textHint: "hintText",
                    textInputType: TextInputType.emailAddress,
                    obscureControl: false,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  InputTextBox(
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
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFF478DE0),
                    ),
                    child: DropdownButton<int>(
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
                      onChanged: (value) {
                        setState(() {
                          menuItemValue = value;
                        });
                      },
                      items: [
                        DropdownMenuItem(
                          child: Text(
                            "Öğrenci",
                            style: TextStyle(color: Colors.white),
                          ),
                          value: 1,
                        ),
                        DropdownMenuItem(
                            child: Text(
                              "Öğretmen",
                              style: TextStyle(color: Colors.white),
                            ),
                            value: 2)
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(vertical: 25.0),
                      width: double.infinity,
                      child: Button(
                        buttonName: "KAYDOL",
                        onPress: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      TeacherNewUserDetails(
                                        teacherNameSurname: adSoyad,
                                      )));
                        },
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
