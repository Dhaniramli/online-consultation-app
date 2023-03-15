import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/app_session.dart';

class CsEditProfileController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  TextEditingController photoC = TextEditingController();
  TextEditingController fullNameC = TextEditingController();
  TextEditingController dateC = TextEditingController();
//  TextEditingController jenderC = TextEditingController();
  TextEditingController kotaC = TextEditingController();
  TextEditingController noTelponC = TextEditingController();

  int jenderC = 0;

  void setGender(int value) {
    jenderC = value; // set value jenderC
  }

  int valueC = 1;

  onUpdate() async {
    await _firestore.collection("users").doc(currentUser).update({
      "photo": photoC,
      "fullName": fullNameC,
      "dateOfBirth": dateC,
      "kota": kotaC,
      "noTelpon": noTelponC,
    });
  }
}
