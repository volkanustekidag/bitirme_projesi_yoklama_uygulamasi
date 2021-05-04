class Student {
  String studentUID;
  String studentNameSurname;
  String studentMail;
  String studentDepartment;
  String studentImageUrl;
  List<String> studentLesson;

  Student(
      {this.studentUID,
      this.studentNameSurname,
      this.studentMail,
      this.studentDepartment,
      this.studentImageUrl,
      this.studentLesson});

  Student.fromJson(Map<String, dynamic> json) {
    studentUID = json['studentUID'];
    studentNameSurname = json['studentNameSurname'];
    studentMail = json['studentMail'];
    studentDepartment = json['studentDepartment'];
    studentImageUrl = json['studentImageUrl'];
    studentLesson = json['studentLesson'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['studentUID'] = this.studentUID;
    data['studentNameSurname'] = this.studentNameSurname;
    data['studentMail'] = this.studentMail;
    data['studentDepartment'] = this.studentDepartment;
    data['studentImageUrl'] = this.studentImageUrl;
    data['studentLesson'] = this.studentLesson;
    return data;
  }
}
