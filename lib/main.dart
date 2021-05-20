import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yoklama/module/theme_data_modal.dart';
import 'package:yoklama/screen/login_screen.dart';
void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeDataModal(),
    child: Baslangic(),
  ));
}

class Baslangic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return MaterialApp(
      theme: Provider.of<ThemeDataModal>(context).getThemeData,
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        animationDuration: Duration(seconds: 2),
        splash: Hero(
            tag: "tag", child: Image(image: AssetImage('images/logo.png'))),
        nextScreen: LoginScreen(),
        splashTransition: SplashTransition.slideTransition,
      ),
    );
  }
}
