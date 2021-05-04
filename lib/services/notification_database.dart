import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> addNotification() async {
  DocumentReference notificationRef =
      FirebaseFirestore.instance.collection("notifications").doc();
}
