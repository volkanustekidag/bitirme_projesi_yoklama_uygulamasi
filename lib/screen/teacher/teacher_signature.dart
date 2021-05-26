import 'package:flutter/material.dart';
import 'package:yoklama/module/lesson.dart';
import 'package:yoklama/module/signature.dart';
import 'package:yoklama/screen/teacher/teacher_signature_current.dart';
import 'package:yoklama/services/lesson_database.dart';
import 'package:yoklama/services/signature_database.dart';
import 'package:yoklama/utilities/constants.dart';
import 'package:intl/intl.dart';

class TeacherSignature extends StatefulWidget {
  final Lesson lesson;

  const TeacherSignature({Key key, this.lesson}) : super(key: key);

  @override
  _TeacherSignatureState createState() => _TeacherSignatureState(lesson);
}

class _TeacherSignatureState extends State<TeacherSignature> {
  Lesson lesson;
  Signature signature = new Signature();
  String signatureKey;
  bool loadingData = true;
  List<Signature> listSignatures = [];

  _TeacherSignatureState(this.lesson);

  void getKey() {
    setState(() {
      signatureKey = lesson.lessonId + "-" + getDate();
    });
  }

  String getDate() {
    DateTime today = new DateTime.now();
    DateFormat dateFormat = new DateFormat('yy.MM.dd HH:mm');
    String date = dateFormat.format(today);

    return date;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getReSignature();
    getSignatures().then((value) => setState(() {
          loadingData = false;
        }));
  }

  Future<void> getReSignature() async {
    lesson = await getLesson(lesson.lessonId);
  }

  Future<void> getSignatures() async {
    lesson = await getLesson(lesson.lessonId);
    for (String signatureId in lesson.signatures) {
      listSignatures.add(await getSignature(signatureId));
      print(signatureId);
    }
    print(listSignatures.length);
  }

  Future<void> createSignature() async {
    signature.signatureStudents = [];
    signature.signatureId = signatureKey;
    signature.signatureDate = getDate();

    await addSignature(signature);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: 80,
            width: double.infinity,
            child: GestureDetector(
              onTap: () async {
                getKey();
                lesson.signatures.add(signatureKey);
                lesson.signatureOnline = true;
                createSignature();
                await updateLesson(lesson).then((value) => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TeacherSignatureCurrent(
                            lesson: lesson, signatureKey: signatureKey))));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person_search,
                    color: kBlueFontToune,
                  ),
                  Text(
                    'Yoklama Başlat',
                    style: TextStyle(
                      color: Color(0xFF478DE0),
                      fontFamily: 'OpenSans',
                      fontSize: 18.00,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(4, 4),
                    blurRadius: 10,
                    spreadRadius: 2,
                    color: Colors.black.withOpacity(0.5),
                  )
                ],
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15))),
          ),
          Expanded(
              child: loadingData == true
                  ? Center(child: CircularProgressIndicator())
                  : (listSignatures.isEmpty
                      ? Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            children: [
                              Icon(
                                Icons.person_pin,
                                size: 30,
                                color: Colors.black38,
                              ),
                              Text(
                                'Henüz hiç yoklama alınmamış.',
                                style: TextStyle(
                                  color: Colors.black38,
                                  fontSize: 20.00,
                                ),
                              )
                            ],
                          ),
                        )
                      : ListView.builder(
                          itemCount: listSignatures.length,
                          itemBuilder: (context, index) => itemSignatureBuilder(
                              listSignatures[index], context),
                        ))),
        ],
      ),
    );
  }

  Widget itemSignatureBuilder(Signature signature, BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(signature.signatureDate),
        leading: Icon(Icons.person_pin_circle),
        trailing: Text(
            signature.signatureStudents.length.toString() + " Kişi katıldı."),
      ),
    );
  }
}
