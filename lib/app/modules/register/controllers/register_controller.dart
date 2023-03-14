import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  late String typeC;
  late bool isLoadingC = false;

  @override
  void onInit() {
    super.onInit();
    typeC = Get.parameters['type'] ?? '';
  }

  TextEditingController fullNameC = TextEditingController();
  TextEditingController usernameC = TextEditingController();
  TextEditingController noTelponC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> register() async {
    if (fullNameC.text.isNotEmpty &&
        usernameC.text.isNotEmpty &&
        noTelponC.text.isNotEmpty &&
        emailC.text.isNotEmpty &&
        passwordC.text.isNotEmpty) {
      try {
        final userCredential = await _auth.createUserWithEmailAndPassword(
          email: emailC.text,
          password: passwordC.text,
        );

        if (userCredential.user != null && typeC != null) {
          String uid = userCredential.user!.uid;

          await _firestore.collection("users").doc(emailC.text).set({
            "fullName": fullNameC.text,
            "username": usernameC.text,
            "noTelpon": noTelponC.text,
            "email": emailC.text,
            "uid": uid,
            "createAt": DateTime.now().toIso8601String(),
            "photo": "",
            "type": typeC,
            "status": "Unavalible",
          });
          await userCredential.user!.sendEmailVerification();
          print("REGISTER BERHASIL");
          isLoadingC = false;
          print("${typeC}");

          Get.back();
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          Get.snackbar(
              "Terjadi kesalahan", "Password yang digunakan terlalu singkat");
        } else if (e.code == 'email-already-in-use') {
          Get.snackbar("Terjadi kesalahan",
              "Email Sudah Ada, tidak dapat menambahkan akun");
        }
      } catch (e) {
        Get.snackbar("Terjadi kesalahan", "Tidak dapat menambahkan akun");
      }
    } else {
      Get.snackbar("Terjadi kesalahan", "Nama Lengkap, Lengkapi Form");
    }
  }
}
