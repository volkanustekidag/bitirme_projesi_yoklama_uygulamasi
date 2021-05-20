import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Authentication {
  String email;
  String pass;
  String nameSurname;
  String department;
  String uid;

  Authentication(
      {this.email, this.pass, this.nameSurname, this.department, this.uid});

  Future<void> forgotPassword(String email) {
    FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  Future<String> getUID() async {
    String uid = FirebaseAuth.instance.currentUser.uid.toString();
    return "$uid";
  }

  Future<void> signIn() async {
    Firebase.initializeApp();
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: pass);
  }

  Future<void> registerUser(String userType) async {
    Firebase.initializeApp();
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: pass)
        .then((value) => null);

    return;
  }

  Future<String> getUserProfileImageURL() async {
    String uid = await getUID();

    Reference reference =
        FirebaseStorage.instance.ref().child("/usersprofilephoto/$uid");

    var response = reference.getDownloadURL();

    return response;
  }
}
