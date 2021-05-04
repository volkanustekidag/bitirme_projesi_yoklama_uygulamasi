class Lesson {
  String lessonName;
  String departmentName;
  String percent;
  String lessonPersonUID;
  String comment;
  List<String> notifications;

  Lesson(
      {this.lessonName,
      this.departmentName,
      this.percent,
      this.lessonPersonUID,
      this.comment,
      this.notifications});

  Lesson.fromJson(Map<String, dynamic> json) {
    lessonName = json['lessonName'];
    departmentName = json['departmentName'];
    percent = json['percent'];
    lessonPersonUID = json['lessonPersonUID'];
    comment = json['comment'];
    comment = json['notifications'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lessonName'] = this.lessonName;
    data['departmentName'] = this.departmentName;
    data['percent'] = this.percent;
    data['lessonPersonUID'] = this.lessonPersonUID;
    data['comment'] = this.comment;
    data['notifications'] = this.notifications;
    return data;
  }
}
