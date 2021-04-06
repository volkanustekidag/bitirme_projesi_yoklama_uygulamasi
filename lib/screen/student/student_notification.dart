import 'package:flutter/material.dart';
import 'package:yoklama/screen/teacher/teacher_notification_details.dart';

class StudentNotification extends StatefulWidget {
  @override
  _StudentNotificationState createState() => _StudentNotificationState();
}

String postContent;

List<String> post = [
  "Bitirme Projesi için bu hafta sunum yapılmayacaktır. Sınav dolayısıyla sunumu haftaya erteledik. \n\n Saygılarımla"
];

class _StudentNotificationState extends State<StudentNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: AnimatedList(
              initialItemCount: post.length,
              itemBuilder: (context, index, animation) {
                return buildItem(post[index], context);
              }),
        ),
      ],
    ));
  }

  Widget buildItem(String item, BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Card(
        child: ListTile(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        TeachNotificationDetails()));
          },
          leading: CircleAvatar(
            backgroundImage: AssetImage('images/ali.jpg'),
          ),
          title: Text('Ali Arı'),
          trailing: Icon(Icons.arrow_forward_ios),
          subtitle: Text(item),
        ),
      ),
    );
  }
}
