import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:yoklama/utilities/constants.dart';
import 'screen/login_screen.dart';

void main() => runApp(Baslangic());

class Baslangic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        //aaaaa
        //aaa
        splash: Image(image: AssetImage('images/logo.png')),
        nextScreen: Yoklama(),
        splashTransition: SplashTransition.slideTransition,
      ),
    );
  }
}
