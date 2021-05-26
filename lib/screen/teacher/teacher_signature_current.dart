import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:yoklama/module/lesson.dart';
import 'package:intl/intl.dart';
import 'package:yoklama/services/lesson_database.dart';

class TeacherSignatureCurrent extends StatefulWidget {
  final Lesson lesson;
  final String signatureKey;
  const TeacherSignatureCurrent({Key key, this.lesson, this.signatureKey})
      : super(key: key);
  @override
  _TeacherSignatureCurrentState createState() =>
      _TeacherSignatureCurrentState(lesson, signatureKey);
}

class _TeacherSignatureCurrentState extends State<TeacherSignatureCurrent> {
  final Lesson lesson;
  final String signatureKey;

  bool onBackCheck = true;

  _TeacherSignatureCurrentState(this.lesson, this.signatureKey);

  String getDate() {
    DateTime today = new DateTime.now();
    DateFormat dateFormat = new DateFormat('yy.MM.dd HH:mm');
    String date = dateFormat.format(today);

    return date;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onBackDialog,
      child: Scaffold(
        appBar: AppBar(title: Text(lesson.lessonName + " Anlık Yoklama")),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Text(
                  getDate() + "\nYoklaması",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
              ),
              Expanded(
                flex: 5,
                child: QrImage(
                  size: MediaQuery.of(context).size.width / 2,
                  data: "$signatureKey",
                ),
              ),
              Expanded(
                flex: 1,
                child: ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.group),
                        Text(" Katılan Kişi Sayisi: "),
                        Text("0",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold))
                      ],
                    )),
              ),
              Spacer(),
              Expanded(
                flex: 1,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red)),
                    onPressed: () => onBackDialog2(),
                    child: Text("Yoklamayı Bitir")),
              )
            ],
          ),
        ),
      ),
    );
  }

  onBackDialog2() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.warning,
                        color: Colors.blue,
                      )),
                  Expanded(
                      flex: 4, child: Text("Yoklamayı sonlandıracaksınız?")),
                ],
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    lesson.signatureOnline = false;
                    updateLesson(lesson);
                    Navigator.pop(context, Navigator.pop(context));
                  },
                  child: Text("Evet"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Hayır"),
                ),
              ],
              content: Text(
                  "Şimdi çıkarsanız bu yoklamaya öğrenciler ulaşamayacak ve sonlandırılacaktır.Bunu yapmak istediğinizden emin misiniz?"),
            ));
  }

  Future<bool> onBackDialog() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.warning,
                        color: Colors.blue,
                      )),
                  Expanded(
                      flex: 4, child: Text("Yoklamayı sonlandıracaksınız?")),
                ],
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      lesson.signatureOnline = false;
                      updateLesson(lesson).then((value) =>
                          Navigator.pop(context, Navigator.pop(context)));
                    });
                  },
                  child: Text("Evet"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: Text("Hayır"),
                ),
              ],
              content: Text(
                  "Şimdi çıkarsanız bu yoklamaya öğrenciler ulaşamayacak ve sonlandırılacaktır.Bunu yapmak istediğinizden emin misiniz?"),
            ));
  }
}
