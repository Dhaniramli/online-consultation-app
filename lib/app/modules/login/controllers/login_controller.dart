import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  // var isSkipintro = false.obs;
  var isAuth = false.obs;
  late bool isLoadingC = false;
  late String typeC;

  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // var patient = await _firestore.collection('users').doc('patient');

  Future<void> logIn() async {
    isLoadingC == true;
    if (emailC.text.isNotEmpty && passwordC.text.isNotEmpty) {
      try {
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: emailC.text,
          password: passwordC.text,
        );

        if (userCredential.user != null) {
          if (userCredential.user!.emailVerified == true) {
            String uid = _auth.currentUser!.uid;

            var docRef =
                FirebaseFirestore.instance.collection('users').doc(emailC.text);

            docRef.get().then((docSnapshot) {
              if (docSnapshot.exists) {
                // Dokumen ditemukan
                var data = docSnapshot.data();
                if (data!['type'] == typeC) {
                  // Data sesuai kriteria, lakukan sesuatu
                  print('Data dari dokumen ${emailC.text}');
                  print('Nama: ${data['type']}');
                  Get.offAllNamed(Routes.CS_MAIN_NAVIGATION);
                  emailC.clear();
                  passwordC.clear();
                  if (data['type'] == 'patient') {
                    Get.offAllNamed(Routes.CS_MAIN_NAVIGATION);
                  } else if (data['type'] == 'doctor') {
                    Get.offAllNamed(Routes.DOC_MAIN_NAVIGATION);
                  }
                } else {
                  // Data tidak sesuai kriteria
                  print('Email belum terdaftar');
                  Get.snackbar("Terjadi Kesalahan",
                      "Anda Belum terdaftar sebagai ${typeC}");
                }
              } else {
                // Dokumen tidak ditemukan
                print('${emailC.text} tidak ditemukan.');
                Get.snackbar("Terjadi Kesalahan", "Email tidak terdaftar");
              }
            });
          } else {
            Get.defaultDialog(
                title: "Belum Verifikasi",
                middleText:
                    "Kamu Belum Verifkasi akun ini. Lakukan verifikasi diemail kamu");
          }
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          Get.snackbar("Terjadi Kesalahan", "Email tidak terdaftar");
        } else if (e.code == 'wrong-password') {
          Get.snackbar("Terjadi Kesalahan", "Email tidak terdaftar");
        }
      } catch (e) {
        Get.snackbar("Terjadi Kesalahan", "Tidak dapat login");
      }
    } else {
      Get.snackbar("Terjadi Kesalahan", "Email dan Password wajib diisi");
    }
  }

  Future<void> logOut() async {
    await _auth.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }
}
