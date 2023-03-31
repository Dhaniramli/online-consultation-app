import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AppSession {}

get currentUser {
  return FirebaseAuth.instance.currentUser!.email;
}

get currentUserId {
  return FirebaseAuth.instance.currentUser!.uid;
}

get userDoctor {
  return FirebaseFirestore.instance
      .collection("users")
      .where("type", isEqualTo: "doctor");
}

// String currentUser = FirebaseAuth.instance.currentUser.email;

DocumentReference get userCollection {
  return FirebaseFirestore.instance.collection("users").doc(currentUser);
}

Future<QuerySnapshot<Map<String, dynamic>>> get chatCollection {
  return FirebaseFirestore.instance
      .collection('chatroom')
      .doc('documentId') // ganti dengan id dokumen yang valid
      .collection('chats')
      .where("sendto", isEqualTo: currentUser)
      .get();
}
