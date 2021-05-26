import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yoklama/module/signature.dart';

Future<void> addSignature(Signature signature) async {
  DocumentReference documentReference = FirebaseFirestore.instance
      .collection("signatures")
      .doc(signature.signatureId);

  documentReference.set(signature.toJson());
}

Future<Signature> getSignature(String signatureId) async {
  DocumentReference documentReference =
      FirebaseFirestore.instance.collection("signatures").doc(signatureId);

  var response = await documentReference.get();
  var data = response.data();

  return new Signature.fromJson(data);
}
