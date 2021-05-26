import 'package:flutter/material.dart';
import 'package:yoklama/module/lesson.dart';
import 'package:yoklama/module/student.dart';
import 'package:yoklama/services/student_user_database.dart';

class TeacherSList extends StatefulWidget {
  final Lesson lesson;

  const TeacherSList({Key key, this.lesson}) : super(key: key);
  @override
  _TeacherSListState createState() => _TeacherSListState(lesson);
}

class _TeacherSListState extends State<TeacherSList> {
  final Lesson lesson;
  bool loadingList = true;

  List<Student> studentList = [];

  _TeacherSListState(this.lesson);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getStudents().then((value) {
      setState(() {
        loadingList = false;
      });
    });
  }

  Future<void> getStudents() async {
    for (String uid in lesson.students) {
      print(uid + "******");
      studentList.add(await getStudentUser(uid));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            alignment: Alignment.center,
            child: loadingList == true
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ((studentList.isEmpty
                    ? Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          children: [
                            Icon(
                              Icons.group,
                              size: 30,
                              color: Colors.black38,
                            ),
                            Text(
                              'Henüz hiç öğrenci katılmamış.',
                              style: TextStyle(
                                color: Colors.black38,
                                fontSize: 20.00,
                              ),
                            )
                          ],
                        ),
                      )
                    : ListView.builder(
                        itemCount: studentList.length,
                        itemBuilder: (context, index) {
                          return itemBuilder(
                              studentList[index], index, context);
                        },
                      )))));
  }
}

String getUserTag(String nameLastName) {
  var nameSurname = nameLastName.split(" ");

  return ((nameSurname[0])[0] + (nameSurname[1])[0]).toUpperCase();
}

Widget itemBuilder(Student student, int index, BuildContext context) {
  return Container(
    child: Card(
      child: ListTile(
        leading: CircleAvatar(
            backgroundImage: student.studentImageUrl.isEmpty
                ? Text(
                    "${getUserTag(student.studentNameSurname)}",
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )
                : NetworkImage(student.studentImageUrl)),
        title: Text(student.studentNameSurname),
        subtitle: Text(student.studentDepartment),
      ),
    ),
  );
}
