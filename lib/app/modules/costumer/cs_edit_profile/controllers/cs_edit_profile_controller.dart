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

  late String emailC;
  @override
  void onInit() {
    super.onInit();
    emailC = Get.parameters['emailV'] ?? '';
  }

  int valueC = 1;
  late String jenderC;
  void setGender(int value) {
    print("Jender ${value}");
    if (value == 1) {
      jenderC = 'Laki - Laki';
    } else if (value == 2) {
      jenderC = 'Perempuan';
    } else {
      jenderC = 'Laki - Laki';
    }
  }


  onUpdate() async {
    try {
      await _firestore.collection("users").doc(emailC).update({
        "photo": photoC.text,
        "fullName": fullNameC.text,
        "dateOfBirth": dateC.text,
        "kota": kotaC.text,
        "jender": jenderC,
        "noTelpon": noTelponC.text,
      });
      Get.back();
    } catch (err) {
      Get.snackbar("Terjadi kesalahan", "Tidak dapat mengedit profil");
    }
  }
}
