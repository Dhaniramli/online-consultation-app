

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AppSession {}

get currentUser {
  return FirebaseAuth.instance.currentUser;
}

DocumentReference get userCollection {
  return FirebaseFirestore.instance.collection("users").doc(currentUser.email);
}