import 'package:flutter/material.dart';
import 'package:yoklama/utilities/constants.dart';

class TeacherStudentList extends StatefulWidget {
  @override
  _TeacherStudentListState createState() => _TeacherStudentListState();
}

class _TeacherStudentListState extends State<TeacherStudentList> {
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

String getUserTag(String nameLastName) {
  var nameSurname = nameLastName.split(" ");

  return ((nameSurname[0])[0] + (nameSurname[1])[0]).toUpperCase();
}

Widget itemBuilder(
    String nameLastName, Animation animation, int index, BuildContext context) {
  return Container(
    child: Card(
      child: ListTile(
        leading: CircleAvatar(
          child: Text(
            "${getUserTag(nameLastName)}",
            style: TextStyle(
                fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        title: Text(nameLastName),
        subtitle: Text("13.09.2020'inde tarihinde katıldı."),
      ),
    ),
  );
}
