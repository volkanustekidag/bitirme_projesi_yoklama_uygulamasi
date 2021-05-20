class Signature {
  String signatureId;
  String signatureDate;
  List<String> signatureStudents;

  Signature({this.signatureId, this.signatureDate, this.signatureStudents});

  Signature.fromJson(Map<String, dynamic> json) {
    signatureId = json['signatureId'];
    signatureDate = json['signatureDate'];
    signatureStudents = json['signatureStudents'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['signatureId'] = this.signatureId;
    data['signatureDate'] = this.signatureDate;
    data['signatureStudents'] = this.signatureStudents;
    return data;
  }
}
