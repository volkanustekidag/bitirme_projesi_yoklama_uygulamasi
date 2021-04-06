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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: <Widget>[
              Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: CircleAvatar(
                          backgroundImage: AssetImage('images/ali.jpg'),
                          maxRadius: 30,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Ali Arı',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '13:29 6.01.2021',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: Container(child: Icon(Icons.more_horiz)))
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Text(
                    "Bitirme Projesi için bu hafta sunum yapılmayacaktıry. Sınav dolayısıyla sunumu haftaya erteledi"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
