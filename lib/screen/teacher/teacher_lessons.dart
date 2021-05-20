import 'package:yoklama/module/teacher.dart';
import 'package:yoklama/screen/teacher/teacher_main_drawer.dart';
import 'package:yoklama/services/lesson_database.dart';
import 'package:yoklama/services/teacher_user_database_crud.dart';
import 'package:yoklama/utilities/constants.dart';
import 'package:yoklama/module/lesson.dart';
import 'package:flutter/material.dart';
import 'package:flutter_unicons/flutter_unicons.dart';
import 'package:yoklama/utilities/widgets.dart';
import 'teacher_lesson_details.dart';

class TeacherLessons extends StatefulWidget {
  @override
  _TeacherLessonsState createState() => _TeacherLessonsState();
}

class _TeacherLessonsState extends State<TeacherLessons> {
  int selectedIndex = 0;
  Lesson lesson = new Lesson();
  Teacher teacher;

  final GlobalKey<AnimatedListState> key = GlobalKey();

  List<Lesson> items = [];

  bool loading = true;

  @override
  void initState() {
    super.initState();
    getLessons().then((value) {
      setState(() {
        loading = false;
      });
    });
  }

  Future<void> getLessons() async {
    teacher = await teacherUserGetData();
    for (String item in teacher.teacherLesson) {
      print(item);
      items.add(await getLesson(item));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: <Widget>[
          Text(
            'Dersler',
            style:
                TextStyle(fontFamily: 'OpenSans', fontWeight: FontWeight.bold),
          ),
        ]),
      ),
      drawer: MainDrawer(
        teacher: teacher,
      ),
      body: Stack(children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(bottom: 10.0),
              width: double.infinity,
              child: RaisedButton(
                onPressed: () {
                  teacherUserGetData();
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
                      width: 15.0,
                    ),
                    Text(
                      'Ders Oluştur',
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
                child: loading == true
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        itemBuilder: (context, index) =>
                            _buildItem(items[index], index, context),
                        itemCount: items.length,
                      ))
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
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Column(children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              Navigator.pop(context);
                            });
                          },
                          child: Icon(
                            Icons.close,
                          )),
                      GestureDetector(
                        onTap: () async {
                          createLesson(lesson);
                          setState(() {
                            items.add(lesson);
                            lesson = new Lesson();
                          });
                          Navigator.pop(context);
                        },
                        child: Text('+Oluştur',
                            style:
                                TextStyle(fontSize: 20, color: kBlueFontToune)),
                      ),
                    ],
                  ),
                  InputTextBox(
                      onChanged: (val) {
                        lesson.lessonName = val;
                      },
                      boxIcon: Icon(
                        Icons.book,
                        color: Colors.white,
                      ),
                      textHint: "Ders Adı",
                      textInputType: null,
                      obscureControl: false),
                  InputTextBox(
                      onChanged: (val) {
                        lesson.departmentName = val;
                      },
                      boxIcon: Icon(
                        Icons.school,
                        color: Colors.white,
                      ),
                      textHint: "Bölüm Adı",
                      textInputType: null,
                      obscureControl: false),
                  InputTextBox(
                      onChanged: (val) {
                        lesson.percent = val;
                      },
                      boxIcon:
                          Icon(Icons.filter_alt_outlined, color: Colors.white),
                      textHint: "Devamsızlık Yüzdelik Şart",
                      textInputType: TextInputType.number,
                      obscureControl: false),
                  InputTextBox(
                      onChanged: (val) {
                        lesson.comment = val;
                      },
                      boxIcon: Icon(Icons.insert_comment, color: Colors.white),
                      textHint: "Ders Hakkında Açıklama",
                      textInputType: null,
                      obscureControl: false),
                ]),
              ));
        });
  }
}

Widget _buildItem(Lesson item, int index, BuildContext context) {
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
        subtitle: Text("10 Öğrenci"),
        trailing: IconButton(
          icon: Icon(Icons.book),
          onPressed: () {},
        ),
      ),
    ),
  );
}
