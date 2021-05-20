class Teacher {
  String teachertUID;
  String teacherNameSurname;
  String teacherMail;
  String teacherDepartment;
  String profileImageURL;
  List<String> teacherLesson;

  Teacher(
      {this.teachertUID,
      this.teacherNameSurname,
      this.teacherMail,
      this.teacherDepartment,
      this.profileImageURL,
      this.teacherLesson});

  Teacher.fromJson(Map<String, dynamic> json) {
    teachertUID = json['teachertUID'];
    teacherNameSurname = json['teacherNameSurname'];
    teacherMail = json['teacherMail'];
    teacherDepartment = json['teacherDepartment'];
    profileImageURL = json['profileImageURL'];
    teacherLesson = json['teacherLesson'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['teachertUID'] = this.teachertUID;
    data['teacherNameSurname'] = this.teacherNameSurname;
    data['teacherMail'] = this.teacherMail;
    data['teacherDepartment'] = this.teacherDepartment;
    data['teacherLesson'] = this.teacherLesson;
    data['profileImageURL'] = this.profileImageURL;
    return data;
  }
}
