import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_consultation_app/app/data/app_session.dart';

class ChangePassController extends GetxController {
  late TextEditingController oldPasswordC;
  late TextEditingController newPasswordC;

  @override
  void onInit() {
    oldPasswordC = TextEditingController();
    newPasswordC = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    oldPasswordC.dispose();
    newPasswordC.dispose();
    super.onClose();
  }

  var auth = FirebaseAuth.instance;
  var currentUserC = FirebaseAuth.instance.currentUser;

  void changePass() async {
    if (oldPasswordC.text.isNotEmpty && newPasswordC.text.isNotEmpty) {
      try {
        var cred = EmailAuthProvider.credential(
          email: currentUser,
          password: oldPasswordC.text,
        );
        await currentUserC!.reauthenticateWithCredential(cred).then(
          (value) {
            currentUserC!.updatePassword(newPasswordC.text);
          },
        );
        Get.snackbar("Sukses", "Password Berhasil DiUbah");
        oldPasswordC.clear();
        newPasswordC.clear();
      } catch (err) {
        print(err);
        Get.snackbar("Terjadi Kesalahan", "Tidak Dapat Mengubah Password");
      }
    } else {
      Get.snackbar(
          "Terjadi Kesalahan", "Sandi Lama dan Sandi Baru Harus Di Isi");
    }
  }
}
