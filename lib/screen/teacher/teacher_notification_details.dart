import 'package:flutter/material.dart';
import 'package:yoklama/module/notification.dart';
import 'package:yoklama/module/teacher.dart';
import 'package:yoklama/services/teacher_user_database_crud.dart';

class TeachNotificationDetails extends StatefulWidget {
  final Notificationn notificationn;
  final Teacher teacher;

  TeachNotificationDetails(this.notificationn, this.teacher);
  @override
  _TeachNotificationDetailsState createState() =>
      _TeachNotificationDetailsState(notificationn, teacher);
}

class _TeachNotificationDetailsState extends State<TeachNotificationDetails> {
  final Notificationn notificationn;
  final Teacher teacher;
  bool dataLoadign = true;
  _TeachNotificationDetailsState(this.notificationn, this.teacher);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(teacher.teacherNameSurname);
  }

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
                            '${notificationn.notificationDate}',
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
                  "${notificationn.notificationContent}",
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
