import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:yoklama/screen/login_screen.dart';

void main() => runApp(Baslangic());

class Baslangic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //deneme22222
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        //aadasdaaa
        splash: Image(image: AssetImage('images/logo.png')),
        nextScreen: Yoklama(),
        splashTransition: SplashTransition.slideTransition,
      ),
    );
  }
}
