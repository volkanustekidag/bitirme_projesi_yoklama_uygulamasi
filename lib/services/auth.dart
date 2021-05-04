import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

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

    // String uid = await getUID();

    // DocumentReference firebaseFirestore =
    //     FirebaseFirestore.instance.collection('students').doc(uid);

    // firebaseFirestore
    //     .set({
    //       'uid': uid,
    //       'ad_soyad': nameSurname,
    //       'email': email,
    //     })
    //     .then((value) => print("User Added"))
    //     .catchError((error) => print("Failed to add user: $error"));

    return;
  }
}
