import 'package:flutter/material.dart';
import 'package:yoklama/utilities/widgets.dart';

class ForgotPassView extends StatefulWidget {
  @override
  _ForgotPassViewState createState() => _ForgotPassViewState();
}

class _ForgotPassViewState extends State<ForgotPassView> {
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
                      stops: [
                    0.1,
                    0.4,
                    0.7,
                    0.9
                  ],
                      colors: [
                    Color(0xFF73AEF5),
                    Color(0xFF61A4F1),
                    Color(0xFF478DE0),
                    Color(0xFF398AE5),
                  ]))),
          Container(
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 40,
              ),
              child: Column(
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
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Şifremi Unuttum",
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
                      boxTitle: "boxTitle",
                      boxIcon: Icon(
                        Icons.mail,
                        color: Colors.white,
                      ),
                      textHint: "Mail",
                      textInputType: TextInputType.emailAddress,
                      obscureControl: false),
                  SizedBox(
                    height: 15,
                  ),
                  Button(buttonName: "Şifremi Sıfırla", onPress: () {}),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
