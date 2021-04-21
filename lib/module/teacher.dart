import 'package:yoklama/module/lesson.dart';

class Teacher {
  final int teacherId;
  final String teacherNameSurname, mail, degree, imageUrl;
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
