import 'package:flutter/material.dart';
import 'package:yoklama/utilities/constants.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';

class TeacherSignature extends StatefulWidget {
  @override
  _TeacherSignatureState createState() => _TeacherSignatureState();
}

class _TeacherSignatureState extends State<TeacherSignature> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: 80,
            width: double.infinity,
            child: GestureDetector(
              onTap: () {
                buildShowBottomSheet();
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
          // Container(
          //     padding: EdgeInsets.only(top: 200),
          //     child: Column(
          //       children: [
          //         Icon(
          //           Icons.person_pin,
          //           size: 30,
          //           color: Colors.black38,
          //         ),
          //         Text(
          //           'Henüz yoklama alınmamış.',
          //           style: TextStyle(
          //             color: Colors.black38,
          //             fontSize: 20.00,
          //           ),
          //         )
          //       ],
          //     )),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
            child: QrImage(
              size: MediaQuery.of(context).size.width / 3,
              data: "YRYryXBit-20.05.2021",
            ),
          ),
        ],
      ),
    );
  }

  Future buildShowBottomSheet() {
    return showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height - 5,
      ),
    );
  }
}
