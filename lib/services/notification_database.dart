import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yoklama/module/notification.dart';

Future<String> addNotification(Notificationn notification) async {
  DocumentReference notificationRef =
      FirebaseFirestore.instance.collection("notifications").doc();

  String documentId;

  notificationRef
      .set(notification.toJson())
      .then((value) => () {})
      .onError((error, stackTrace) => () {
            print("hata");
          });
  documentId = notificationRef.id;
  print(documentId + " aaa");
  return documentId;
}

Future<Notificationn> getNotification(String id) async {
  DocumentReference documentReference =
      FirebaseFirestore.instance.collection("notifications").doc(id);

  var response = await documentReference.get();
  var data = response.data();

  Notificationn notificationn = Notificationn.fromJson(data);
  print(notificationn.notificationContent);
  return notificationn;
}
