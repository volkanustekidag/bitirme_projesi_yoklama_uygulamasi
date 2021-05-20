class Lesson {
  String lessonId;
  String lessonName;
  String departmentName;
  String percent;
  String lessonPersonUID;
  String comment;
  bool signatureOnline;
  List<String> students;
  List<String> notifications;

  Lesson(
      {this.lessonId,
      this.lessonName,
      this.departmentName,
      this.percent,
      this.lessonPersonUID,
      this.comment,
      this.notifications});

  Lesson.fromJson(Map<String, dynamic> json) {
    lessonId = json['lessonId'];
    lessonName = json['lessonName'];
    departmentName = json['departmentName'];
    percent = json['percent'];
    lessonPersonUID = json['lessonPersonUID'];
    comment = json['comment'];
    signatureOnline = json['signatureOnline'];
    notifications = json['notifications'].cast<String>();
    students = json['students'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lessonId'] = this.lessonId;
    data['lessonName'] = this.lessonName;
    data['departmentName'] = this.departmentName;
    data['percent'] = this.percent;
    data['lessonPersonUID'] = this.lessonPersonUID;
    data['comment'] = this.comment;
    data['signatureOnline'] = this.signatureOnline;
    data['notifications'] = this.notifications;
    data['students'] = this.students;
    return data;
  }
}
