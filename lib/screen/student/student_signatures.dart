import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:yoklama/module/lesson.dart';
import 'package:yoklama/services/lesson_database.dart';

class StudentSignatures extends StatefulWidget {
  final Lesson lesson;

  const StudentSignatures({Key key, this.lesson}) : super(key: key);
  @override
  _StudentSignaturesState createState() => _StudentSignaturesState(lesson);
}

class _StudentSignaturesState extends State<StudentSignatures> {
  Lesson lesson;
  bool loadingPage = true;

  @override
  void initState() {
    super.initState();

    print("deneme");
    getReLesson().then((value) => setState(() => loadingPage = false));
    print(lesson.signatureOnline);
    print(loadingPage);
  }

  Future getReLesson() async {
    lesson = await getLesson(lesson.lessonId);
  }

  _StudentSignaturesState(this.lesson);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: loadingPage == true
              ? CircularProgressIndicator()
              : (lesson.signatureOnline == true
                  ? ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          scanQR();
                        });
                      },
                      child: Icon(Icons.camera_alt))
                  : Center(
                      child: Text("data"),
                    ))),
    );
  }

  String data;
  scanQR() async {
    await FlutterBarcodeScanner.scanBarcode(
            "#ffffff", "cancel", true, ScanMode.QR)
        .then((value) => setState(() {
              data = value;
              print(data + "aa");
            }));
  }
}
