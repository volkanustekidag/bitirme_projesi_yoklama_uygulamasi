import 'package:yoklama/module/lesson.dart';

class Teacher {
  final String teacherNameSurname, mail, degree, imageUrl, teacherId;
  final Lesson lesson;

  Teacher(
    this.teacherId,
    this.teacherNameSurname,
    this.mail,
    this.degree,
    this.imageUrl,
    this.lesson,
  );
}
