import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:yoklama/module/lesson.dart';
import 'package:yoklama/module/notification.dart';
import 'package:yoklama/module/teacher.dart';
import 'package:yoklama/screen/teacher/teacher_notification_details.dart';
import 'package:yoklama/services/auth.dart';
import 'package:yoklama/services/lesson_database.dart';
import 'package:yoklama/services/notification_database.dart';
import 'package:yoklama/services/teacher_user_database_crud.dart';
import 'package:yoklama/utilities/constants.dart';
import 'package:intl/intl.dart';

class TeacherNotification extends StatefulWidget {
  final Lesson lesson;

  const TeacherNotification({Key key, this.lesson}) : super(key: key);
  @override
  _TeacherNotificationState createState() => _TeacherNotificationState(lesson);
}

class _TeacherNotificationState extends State<TeacherNotification> {
  final Lesson lesson;
  Teacher teacher;
  Notificationn notification = new Notificationn();
  List notifications = [];
  bool notificationLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNotificitaions().then((value) {
      setState(() {
        notificationLoading = false;
      });
    });
  }

  creatNotification() async {
    notification.notificationTeacherUID = await new Authentication().getUID();
    DateTime today = new DateTime.now();
    DateFormat dateFormat = new DateFormat('yy.MM.dd HH:mm ss');
    String date = dateFormat.format(today);

    notification.notificationDate = date;

    var notificationId = await addNotification(notification);
    lesson.notifications.add(notificationId);
    updateLesson(lesson);
  }

  Future<void> getNotificitaions() async {
    setState(() {
      notificationLoading = true;
    });
    notifications = [];
    teacher = await teacherUserGetData();

    for (String id in lesson.notifications) {
      print(id + "aa");
      notifications.add(await getNotification(id));
    }

    notifications
        .sort((a, b) => b.notificationDate.compareTo(a.notificationDate));

    setState(() {
      notificationLoading = false;
    });
  }

  final GlobalKey<AnimatedListState> key = GlobalKey();

  _TeacherNotificationState(this.lesson);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                    offset: Offset(4, 4),
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 10,
                    spreadRadius: 2)
              ]),
          child: RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            color: Colors.white,
            child: Row(children: <Widget>[
              notificationLoading == true
                  ? CircleAvatar(
                      child: Icon(Icons.account_circle_rounded),
                    )
                  : CircleAvatar(
                      backgroundImage:
                          NetworkImage('${teacher.profileImageURL}'),
                    ),
              SizedBox(
                width: 8,
              ),
              Text("Dersle ilgili bir duyuru paylaşın...",
                  style: TextStyle(color: Colors.grey, fontSize: 14)),
            ]),
            onPressed: () {
              sheetBottom(context);
            },
          ),
        ),
        Expanded(
          child: notificationLoading == true
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : (notifications.isEmpty == true
                  ? Center(
                      child: Text("Henüz hiç duyuru yapılmamış."),
                    )
                  : ListView.builder(
                      itemCount: notifications.length,
                      itemBuilder: (context, index) =>
                          buildItem(notifications[index], context),
                    )),
        )
      ],
    ));
  }

  Future sheetBottom(BuildContext context) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return new Container(
            height: MediaQuery.of(context).size.height - 50,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(
                        Icons.close,
                      ),
                      GestureDetector(
                        onTap: () {
                          creatNotification();
                          getNotificitaions();
                          Navigator.pop(context);
                        },
                        child: Text("+Paylaş",
                            style:
                                TextStyle(fontSize: 18, color: kBlueFontToune)),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 5,
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage('images/ali.jpg'),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Ali Arı",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    child: TextField(
                      onChanged: (values) {
                        notification.notificationContent = values;
                      },
                      maxLines: 25,
                      minLines: 20,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Duyuru hakkında bir şeyler yaz..."),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  Widget buildItem(Notificationn item, BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Card(
        child: ListTile(
          onTap: () {
            print(item.notificationDate);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        TeachNotificationDetails(item, teacher)));
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
