import 'package:flutter/material.dart';
import 'package:yoklama/utilities/constants.dart';

class TeacherProfile extends StatefulWidget {
  @override
  _TeacherProfileState createState() => _TeacherProfileState();
}

class _TeacherProfileState extends State<TeacherProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            child: Text(
              'DENEME',
              style: kAppBarTextStyle,
            ),
          )
        ],
      ),
    );
  }
}
