import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:online_consultation_app/app/data/app_session.dart';

class CsChatController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String emailC = currentUser;

  Stream<QuerySnapshot<Map<String, dynamic>>> chatStream(String email) {
    return firestore
        .collection("users")
        .doc(email)
        .collection("chats")
        .orderBy("lastTime", descending: true)
        .snapshots();
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> friendStream(String email) {
    return firestore.collection("users").doc(email).snapshots();
  }
}

  // StreamSink chatStream(String email) {
