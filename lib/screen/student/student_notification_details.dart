import 'package:flutter/material.dart';
import 'package:yoklama/module/notification.dart';
import 'package:yoklama/module/teacher.dart';

class StudentNotificationDetails extends StatefulWidget {
  final Notificationn notification;
  final Teacher teacher;

  const StudentNotificationDetails({Key key, this.notification, this.teacher})
      : super(key: key);

  @override
  _StudentNotificationDetailsState createState() =>
      _StudentNotificationDetailsState(notification, teacher);
}

class _StudentNotificationDetailsState
    extends State<StudentNotificationDetails> {
  final Notificationn notification;
  final Teacher teacher;

  _StudentNotificationDetailsState(this.notification, this.teacher);

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
                          backgroundImage:
                              NetworkImage('${teacher.profileImageURL}'),
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
                            '${teacher.teacherNameSurname}',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${notification.notificationDate}',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: PopupMenuButton(
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              child: Row(
                                children: [
                                  Icon(Icons.delete),
                                  Text("Duyuruyu Sil")
                                ],
                              ),
                            )
                          ],
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  "${notification.notificationContent}",
                  style: TextStyle(fontSize: 16),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
