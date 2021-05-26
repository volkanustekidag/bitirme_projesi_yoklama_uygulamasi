import 'package:flutter/material.dart';
import 'package:yoklama/module/lesson.dart';
import 'package:yoklama/module/notification.dart';
import 'package:yoklama/module/teacher.dart';
import 'package:yoklama/screen/student/student_notification_details.dart';
import 'package:yoklama/services/notification_database.dart';
import 'package:yoklama/services/teacher_user_database_crud.dart';

class StudentNotification extends StatefulWidget {
  final Lesson lesson;
  const StudentNotification({Key key, this.lesson}) : super(key: key);

  @override
  _StudentNotificationState createState() => _StudentNotificationState(lesson);
}

String postContent;

List<Notificationn> notifications = [];

class _StudentNotificationState extends State<StudentNotification> {
  final Lesson lesson;
  Teacher teacher;
  _StudentNotificationState(this.lesson);

  bool loadingNotification = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNotifications().then((value) {
      setState(() {
        loadingNotification = false;
      });
    });
  }

  Future<void> getNotifications() async {
    notifications = [];
    for (String id in lesson.notifications) {
      notifications.add(await getNotification(id));
    }

    if (notifications.isNotEmpty)
      teacher =
          await teacherUserGetDatas(notifications[0].notificationTeacherUID);

    notifications
        .sort((a, b) => b.notificationDate.compareTo(a.notificationDate));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: loadingNotification == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : (Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 10),
              child: notifications.isEmpty == true
                  ? Column(
                      children: [
                        Icon(
                          Icons.notifications,
                          size: 30,
                          color: Colors.black38,
                        ),
                        Text(
                          'Henüz hiç duyuru paylaşılmamış.',
                          style: TextStyle(
                            color: Colors.black38,
                            fontSize: 20.00,
                          ),
                        )
                      ],
                    )
                  : ListView.builder(
                      itemCount: notifications.length,
                      itemBuilder: (context, index) =>
                          buildItem(notifications[index], context),
                    ))),
    ));
  }

  Widget buildItem(Notificationn item, BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Card(
        child: ListTile(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        StudentNotificationDetails(
                            notification: item, teacher: teacher)));
          },
          leading: CircleAvatar(
            backgroundImage: NetworkImage('${teacher.profileImageURL}'),
          ),
          title: Text('${teacher.teacherNameSurname}'),
          trailing: Icon(Icons.arrow_forward_ios),
          subtitle: Text(item.notificationContent),
        ),
      ),
    );
  }
}
