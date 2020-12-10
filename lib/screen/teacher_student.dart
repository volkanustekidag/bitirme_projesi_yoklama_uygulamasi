import 'package:flutter/material.dart';
import 'package:yoklama/utilities/constants.dart';

class TeacherStudent extends StatefulWidget {
  @override
  _TeacherStudentState createState() => _TeacherStudentState();
}

class _TeacherStudentState extends State<TeacherStudent> {
  final GlobalKey<AnimatedListState> key = GlobalKey();

  List<String> items = [
    "Volkan Üstekidağ",
    "Ahmet Çavuş",
    "Alican Dik",
    "Ayşe Küçük",
    "Abdullah Mutlu",
    "Aysel Bilmem",
    "Ahmet Çavuş",
    "Alican Dik",
    "Ayşe Küçük",
    "Abdullah Mutlu",
    "Ahmet Çavuş",
    "Alican Dik",
    "Ayşe Küçük",
    "Abdullah Mutlu"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          AnimatedList(
              key: key,
              initialItemCount: items.length,
              itemBuilder: (context, index, animation) {
                return itemBuilder(items[index], animation, index, context);
              })
        ],
      ),
    );
  }
}

Widget itemBuilder(String nameLastName, Animation animation, int index, BuildContext context) {
  return Container(
    child: Card(
      child: ListTile(
        leading: CircleAvatar(
          child: Icon(Icons.person),
        ),
        title: Text(nameLastName),
        subtitle: Text("13.09.2020'inde tarihinde katıldı."),
      ),
    ),
  );
}

/*Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: CircleAvatar(
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 5.0),
                child: Text(nameLastName,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text("15.09.2020'nde katıldı. ",
                    style: TextStyle(fontSize: 12)),
              ),
            ],
          )
        ],
      )*/
