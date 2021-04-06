import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const kBlueFontToune = Color(0xFF478DE0);

const kPrimaryLightColour = Color(0xffbbdefb);

const kPrimaryColour = Color(0xff1976d2);

const kAppBarTextStyle = TextStyle(
  fontFamily: 'OpenSans',
  fontWeight: FontWeight.bold,
);

const kLessonCardTextStyle = TextStyle(
    fontFamily: 'OpenSans',
    fontWeight: FontWeight.w900,
    fontSize: 25.0,
    color: Colors.white);

const double kDefaulPadding = 20;

const LinearGradientBox = BoxDecoration(
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
    ]));
