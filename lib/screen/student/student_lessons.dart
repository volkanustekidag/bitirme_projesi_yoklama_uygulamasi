import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_unicons/flutter_unicons.dart';
import 'package:yoklama/module/lesson.dart';
import 'package:yoklama/module/student.dart';
import 'package:yoklama/screen/student/student_lessons_detail.dart';
import 'package:yoklama/screen/student/student_main_drawer.dart';
import 'package:yoklama/services/auth.dart';
import 'package:yoklama/services/lesson_database.dart';
import 'package:yoklama/services/student_user_database.dart';
import 'package:yoklama/utilities/constants.dart';

class StudentLessons extends StatefulWidget {
  final Student student;

  const StudentLessons({Key key, this.student}) : super(key: key);

  @override
  _StudentLessonsState createState() => _StudentLessonsState(this.student);
}

class _StudentLessonsState extends State<StudentLessons> {
  Student student;

  @override
  final GlobalKey<AnimatedListState> key = GlobalKey();
  List<Lesson> items = [];
  String lessonId;
  bool loadingLesson = true;

  _StudentLessonsState(this.student);

  @override
  void initState() {
    super.initState();
    getLessons().then((value) {
      setState(() {
        loadingLesson = false;
      });
    });
  }

  Future<void> getLessons() async {
    items = [];
    setState(() {
      loadingLesson = true;
    });
    student = await getStudentUser(await new Authentication().getUID());

    for (String id in student.studentLesson) {
      print(id);
      items.add(await getLesson(id));
      print(items[0].lessonName);
    }
    setState(() {
      loadingLesson = false;
    });
  }

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
      drawer: MainDrawer(student),
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
                        color: ThemeData().primaryColor,
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
              child: loadingLesson == true
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : (items.isEmpty
                      ? Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            children: [
                              Icon(
                                Icons.book,
                                size: 30,
                                color: Colors.black38,
                              ),
                              Text(
                                'Henüz hiç derse katılınmamış.',
                                style: TextStyle(
                                  color: Colors.black38,
                                  fontSize: 20.00,
                                ),
                              )
                            ],
                          ),
                        )
                      : ListView.builder(
                          itemBuilder: (context, index) {
                            return _buildItem(items[index], index, context);
                          },
                          itemCount: items.length,
                        )),
            )
          ],
        ),
      ]),
    );
  }

  joinLesson() async {
    print(lessonId);
    student.studentLesson.add(lessonId);

    Lesson lesson = await getLesson(lessonId);
    lesson.students.add(student.studentUID);
    await updateLesson(lesson);
    await updateStudentUser(student);
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
                        onTap: () async {
                          await joinLesson();
                          await getLessons();
                          Navigator.pop(context);
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
                        lessonId = text;
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

Widget _buildItem(Lesson item, int index, BuildContext context) {
  return Container(
    child: Card(
      child: ListTile(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => StudentLessonDetails(
                        lesson: item,
                      )));
        },
        title: Text(
          item.lessonName,
          style: null,
        ),
        subtitle: Text(item.students.length.toString() + " Öğrenci"),
        trailing: IconButton(
          icon: Icon(Icons.book),
          onPressed: () {},
        ),
      ),
    ),
  );
}
