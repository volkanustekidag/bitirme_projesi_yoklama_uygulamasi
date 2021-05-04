class Notification {
  String notificationId;
  String notificationTeacherUID;
  String notificationContent;
  String notificationDate;

  Notification(
      {this.notificationId,
      this.notificationTeacherUID,
      this.notificationContent,
      this.notificationDate});

  Notification.fromJson(Map<String, dynamic> json) {
    notificationId = json['notificationId'];
    notificationTeacherUID = json['notificationTeacherUID'];
    notificationContent = json['notificationContent'];
    notificationDate = json['notificationDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['notificationId'] = this.notificationId;
    data['notificationTeacherUID'] = this.notificationTeacherUID;
    data['notificationContent'] = this.notificationContent;
    data['notificationDate'] = this.notificationDate;
    return data;
  }
}
