import 'package:flutter/material.dart';
import 'package:flutter_unicons/flutter_unicons.dart';
import 'package:yoklama/module/lesson.dart';
import 'package:yoklama/screen/student/student_main_drawer.dart';
import 'package:yoklama/screen/teacher/teacher_lesson_details.dart';
import 'package:yoklama/utilities/constants.dart';

class Student_Lessons extends StatefulWidget {
  @override
  _Student_LessonsState createState() => _Student_LessonsState();
}

class _Student_LessonsState extends State<Student_Lessons> {
  @override
  final GlobalKey<AnimatedListState> key = GlobalKey();

  List<Lesson> items = [
    new Lesson('Bitirme Projesi', 'Davut Hanbay', 65),
    new Lesson('Bilgisayar Müh. G. I', 'Kenan İnce', 30),
  ];

  String lessonName = "", lessonPerson = "", numberOfStudents = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Row(children: <Widget>[
            Text(
              'Dersler',
              style: TextStyle(
                  fontFamily: 'OpenSans', fontWeight: FontWeight.bold),
            ),
          ]),
        ),
      ),
      drawer: MainDrawer(),
      body: Stack(children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(bottom: 10.0),
              width: double.infinity,
              child: RaisedButton(
                onPressed: () {
                  buildShowModalBottomSheet(context);
                },
                elevation: 5.0,
                padding: EdgeInsets.all(20.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Unicon(
                      UniconData.uniPlusCircle,
                      color: kBlueFontToune,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      'Derse Katıl',
                      style: TextStyle(
                        color: Color(0xFF478DE0),
                        fontFamily: 'OpenSans',
                        fontSize: 18.00,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: AnimatedList(
                key: key,
                initialItemCount: items.length,
                itemBuilder: (context, index, animation) {
                  return _buildItem(items[index], animation, index, context);
                },
              ),
            )
          ],
        ),
      ]),
    );
  }

  Future buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return new Container(
              height: MediaQuery.of(context).size.height - 100.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0))),
              child: Column(children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                          onTap: () {
                            setState(() {
                              Navigator.pop(context);
                            });
                          },
                          child: Icon(
                            Icons.close,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            items.insert(
                                0, new Lesson(lessonName, lessonPerson, 52));
                            key.currentState.insertItem(0);
                            Navigator.pop(context);
                          });
                        },
                        child: Text('+Katıl',
                            style:
                                TextStyle(fontSize: 20, color: kBlueFontToune)),
                      ),
                    ),
                  ],
                ),
                Container(
                    margin: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: kBlueFontToune,
                        borderRadius: BorderRadius.circular(10)),
                    height: 60,
                    child: TextField(
                      onChanged: (text) {
                        lessonName = text;
                      },
                      style: TextStyle(color: Colors.white, fontSize: 17),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Ders Kodu',
                        hintStyle: TextStyle(color: Colors.white60),
                        prefixIcon: Icon(Icons.book, color: Colors.white),
                      ),
                    )),
              ]));
        });
  }
}

Widget _buildItem(
    Lesson item, Animation animation, int index, BuildContext context) {
  return Container(
    child: Card(
      child: ListTile(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                      TeacherLessonDetails(item)));
        },
        title: Text(
          item.lessonName,
          style: null,
        ),
        subtitle: Text(item.numberOfStudents.toString() + " Öğrenci"),
        trailing: IconButton(
          icon: Icon(Icons.book),
        ),
      ),
    ),
  );
}
