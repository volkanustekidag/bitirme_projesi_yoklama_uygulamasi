import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:yoklama/module/lesson.dart';
import 'package:yoklama/module/signature.dart';
import 'package:yoklama/services/auth.dart';
import 'package:yoklama/services/lesson_database.dart';
import 'package:yoklama/services/signature_database.dart';
import 'package:yoklama/utilities/constants.dart';

class StudentSignatures extends StatefulWidget {
  final Lesson lesson;

  const StudentSignatures({Key key, this.lesson}) : super(key: key);
  @override
  _StudentSignaturesState createState() => _StudentSignaturesState(lesson);
}

class _StudentSignaturesState extends State<StudentSignatures> {
  Lesson lesson;
  String uid;
  bool loadingPage = true;
  bool loadingList = true;
  String data;
  List<Signature> listSignature = [];

  @override
  void initState() {
    super.initState();
    getReLesson().then((value) {
      setState(() {
        loadingPage = false;
      });
    });
    getSignatures().then((value) {
      setState(() {
        loadingList = false;
      });
    });
  }

  Future getReLesson() async {
    lesson = await getLesson(lesson.lessonId);
  }

  Future<void> getSignatures() async {
    listSignature = [];

    uid = await new Authentication().getUID();
    for (String signatureID in lesson.signatures) {
      listSignature.add(await getSignature(signatureID));
    }
    setState(() {
      loadingList = false;
    });
  }

  _StudentSignaturesState(this.lesson);

  Future<void> joinSignature() async {
    setState(() {
      loadingList = true;
    });
    String uid = await new Authentication().getUID();

    Signature signature = await getSignature(data);

    signature.signatureStudents.add(uid);

    addSignature(signature);
    await getSignatures();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 80,
            width: double.infinity,
            child: GestureDetector(
              onTap: () async {
                if (lesson.signatureOnline == true)
                  scanQR().then((value) => joinSignature());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person_pin,
                    color: kBlueFontToune,
                  ),
                  loadingPage == true
                      ? CircularProgressIndicator()
                      : Text(
                          (lesson.signatureOnline == true
                              ? 'Yoklamaya Katıl'
                              : "Yoklama Başlatılmamış"),
                          style: TextStyle(
                            color: Color(0xFF478DE0),
                            fontFamily: 'OpenSans',
                            fontSize: 16.00,
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
              child: loadingList == true
                  ? Center(child: CircularProgressIndicator())
                  : (listSignature.isEmpty
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
                          itemCount: listSignature.length,
                          itemBuilder: (context, index) =>
                              buildItemSignature(listSignature[index], context),
                        ))),
        ],
      ),
    );
  }

  Widget buildItemSignature(Signature signature, BuildContext context) {
    return Card(
        child: ListTile(
            title: Text(signature.signatureDate),
            trailing: signature.signatureStudents.contains(uid)
                ? Icon(
                    Icons.check,
                    color: Colors.green,
                  )
                : Icon(
                    Icons.clear_rounded,
                    color: Colors.red,
                  )));
  }

  Future<String> scanQR() async {
    await FlutterBarcodeScanner.scanBarcode(
            "#ffffff", "cancel", true, ScanMode.QR)
        .then((value) => setState(() {
              data = value;
            }));
    return data;
  }
}
