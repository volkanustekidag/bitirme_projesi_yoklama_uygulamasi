import 'dart:io';
import 'dart:async';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yoklama/module/teacher.dart';
import 'package:yoklama/screen/teacher/teacher_lessons.dart';
import 'package:yoklama/services/auth.dart';
import 'package:yoklama/services/teacher_user_database_crud.dart';
import 'package:yoklama/utilities/constants.dart';
import 'package:yoklama/utilities/widgets.dart';

class TeacherNewUserDetails extends StatefulWidget {
  final Teacher teacher;
  TeacherNewUserDetails({@required this.teacher});

  @override
  _TeacherNewUserDetailsState createState() =>
      _TeacherNewUserDetailsState(teacher: teacher);
}

class _TeacherNewUserDetailsState extends State<TeacherNewUserDetails> {
  Teacher teacher;
  String teacherNameSurname;

  int pageCount = 0;
  PageController pageController = PageController(initialPage: 0);
  _TeacherNewUserDetailsState({@required this.teacher});

  @override
  void initState() {
    super.initState();

    print(teacher.teachertUID);
    var nameSurname = teacher.teacherNameSurname.split(" ");

    teacherNameSurname =
        ((nameSurname[0])[0] + (nameSurname[1])[0]).toUpperCase();
  }

  File _image;
  final picker = ImagePicker();

  Future getGalleryPhoto() async {
    final image = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      _image = File(image.path);
    });
  }

  Future getCameraPhoto() async {
    final image = await picker.getImage(source: ImageSource.camera);
    setState(() {
      _image = File(image.path);
    });
  }

  Future uploadProfileImage() async {
    Authentication authentication = new Authentication();
    String uid = await authentication.getUID();
    print(uid);
    Reference firebaseStorage =
        FirebaseStorage.instance.ref().child("/usersprofilephoto/$uid");

    firebaseStorage.putFile(_image);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: linearGradientBox,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 100),
        child: PageView(
          controller: pageController,
          pageSnapping: true,
          children: <Widget>[
            buildPageOne(),
            buildPageTwo(context),
          ],
        ),
      ),
    );
  }

  Center buildPageOne() {
    return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.circle,
                color: Colors.white,
                size: 15,
              ),
              SizedBox(
                width: 8,
              ),
              Icon(
                Icons.circle,
                color: Color(0xFF398AE5),
                size: 15,
              ),
            ],
          ),
          Text(
            "Profil fotoğrafı ekleyiniz.",
            style: TextStyle(
                fontSize: 15, color: Colors.white, fontFamily: 'OpenSans'),
          ),
          Stack(children: [
            CircleAvatar(
              backgroundImage:
                  _image == null ? null : FileImage(File(_image.path)),
              child: _image == null
                  ? Text(
                      "$teacherNameSurname",
                      style: TextStyle(
                          fontSize: 60,
                          color: kBlueFontToune,
                          fontWeight: FontWeight.bold),
                    )
                  : null,
              backgroundColor: Colors.white,
              maxRadius: 80,
            ),
            Positioned(
                bottom: 10,
                left: 100,
                child: InkWell(
                  onTap: () {
                    selectionPhotoSheet();
                  },
                  child: Icon(
                    Icons.camera_alt,
                    color: Colors.black.withOpacity(0.8),
                  ),
                ))
          ]),
          ListTile(
            leading: Icon(
              Icons.info,
              color: Colors.white,
            ),
            title: Text(
              "Profil fotoğrafı eklemek, öğrencinizin sizi tanımasında faydalı olacaktır.",
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Button(
                onPress: () {
                  uploadProfileImage();
                  pageController.animateToPage(
                    1,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                  );
                },
                buttonName: "Sonraki"),
          )
        ]));
  }

  Center buildPageTwo(BuildContext context) {
    return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.circle,
                color: Color(0xFF398AE5),
                size: 15,
              ),
              SizedBox(
                width: 8,
              ),
              Icon(
                Icons.circle,
                color: Colors.white,
                size: 15,
              ),
            ],
          ),
          Text(
            " Ünvan seçiniz.",
            style: TextStyle(
                fontSize: 15, color: Colors.white, fontFamily: 'OpenSans'),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Center(
                child: DropdownButton<String>(
                    isExpanded: true,
                    dropdownColor: Colors.white,
                    hint: Text(
                      " Ünvan seçiniz.",
                      style: TextStyle(color: Colors.black),
                    ),
                    value: teacher.teacherDepartment,
                    onChanged: (value) {
                      setState(() {
                        teacher.teacherDepartment = value;
                      });
                    },
                    items: [
                      DropdownMenuItem(
                        value: "Prof",
                        child: Text(
                          " Prof.",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      DropdownMenuItem(
                        value: "Doc",
                        child: Text(
                          " Doç.",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      DropdownMenuItem(
                        value: "Aras",
                        child: Text(
                          " Araş. Grv.",
                          style: TextStyle(color: Colors.black),
                        ),
                      )
                    ]),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Button(
                onPress: () {
                  teacherCreat(teacher).then((value) =>
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  TeacherLessons())));
                },
                buttonName: "Kaydet"),
          )
        ]));
  }

  Future selectionPhotoSheet() {
    return showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height / 10,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                    onPressed: () {
                      getCameraPhoto();

                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.camera_alt, color: Colors.black)),
                SizedBox(
                  width: 20,
                ),
                IconButton(
                    onPressed: () {
                      getGalleryPhoto();
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.photo_album_sharp,
                      color: Colors.black,
                    ))
              ],
            ),
          );
        });
  }
}
