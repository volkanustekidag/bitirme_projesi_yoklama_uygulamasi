import 'package:flutter/material.dart';

class TeachNotificationDetails extends StatefulWidget {
  @override
  _TeachNotificationDetailsState createState() =>
      _TeachNotificationDetailsState();

  String notificationContent;

  TeachNotificationDetails({this.notificationContent});
}

class _TeachNotificationDetailsState extends State<TeachNotificationDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Duyuru Detay',
          style: TextStyle(fontFamily: 'OpenSans', fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                margin: EdgeInsets.only(top: 15, left: 20, right: 5),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image:
                            NetworkImage('https://i.hizliresim.com/kEpByj.jpg'),
                        fit: BoxFit.fill)),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ali Arı',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '13:29 6.01.2021',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              Container(
                  padding: EdgeInsets.only(left: 170, right: 20),
                  child: Icon(Icons.more_horiz))
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Text(
                "Bitirme Projesi için bu hafta sunum yapılmayacaktır. Sınav dolayısıyla sunumu haftaya erteledik. \n\n Saygılarımla"),
          )
        ],
      ),
    );
  }
}
