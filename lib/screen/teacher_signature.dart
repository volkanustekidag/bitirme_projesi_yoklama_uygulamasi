import 'package:flutter/material.dart';
import 'package:yoklama/utilities/constants.dart';

class TeacherSignature extends StatefulWidget {
  @override
  _TeacherSignatureState createState() => _TeacherSignatureState();
}

class _TeacherSignatureState extends State<TeacherSignature> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: 80,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.person_search,
                  color: kBlueFontToune,
                ),
                Text(
                  'Yoklama Başlat',
                  style: TextStyle(
                    color: Color(0xFF478DE0),
                    fontFamily: 'OpenSans',
                    fontSize: 18.00,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(4, 4),
                    blurRadius: 10,
                    spreadRadius: 2,
                    color: Colors.black.withOpacity(0.5),
                  )
                ],
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15))),
          ),
          Container(
              padding: EdgeInsets.only(top: 200),
              child: Column(
                children: [
                  Icon(
                    Icons.person_search,
                    size: 50,
                  ),
                  Text(
                    'Henüz yoklama alınmamış!',
                    style: TextStyle(
                      color: Colors.black38,
                      fontFamily: 'OpenSans',
                      fontSize: 25.00,
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
