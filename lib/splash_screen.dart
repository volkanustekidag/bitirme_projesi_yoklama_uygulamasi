import 'dart:async';

import 'package:flutter/material.dart';
import 'package:yoklama/screen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  startTimer() async {
    return Timer(Duration(seconds: 3), route());
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
          alignment: Alignment.center,
          width: 150,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
            'images/logo.png',
          ))),
        ),
      ),
    );
  }
}
