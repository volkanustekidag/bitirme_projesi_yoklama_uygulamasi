import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:yoklama/module/theme_data_modal.dart';
import 'package:yoklama/screen/login_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeDataModal(),
    child: Baslangic(),
  ));
}

class Baslangic extends StatefulWidget {
  @override
  _BaslangicState createState() => _BaslangicState();
}

class _BaslangicState extends State<Baslangic> {
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();

    return MaterialApp(
        theme: Provider.of<ThemeDataModal>(context).getThemeData,
        debugShowCheckedModeBanner: false,
        home: SplashScreenView(
          navigateRoute: LoginScreen(),
          duration: 4000,
          speed: 10,
          imageSize: 150,
          text: "created by vustkdg",
          textStyle: TextStyle(color: Colors.white, fontSize: 10),
          pageRouteTransition: PageRouteTransition.Normal,
          imageSrc: 'images/logo.png',
          colors: [
            Colors.purple,
            Colors.blue,
            Colors.yellow,
            Colors.red,
          ],
          backgroundColor: Colors.blue,
        ));
  }
}
