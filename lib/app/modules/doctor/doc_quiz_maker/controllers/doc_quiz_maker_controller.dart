import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_consultation_app/app/data/app_session.dart';

import '../../doc_quiz_list/views/doc_quiz_list_view.dart';

class DocQuizMakerController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  late TextEditingController pertanyaanC;
  late TextEditingController jwb1C;
  late TextEditingController jwb2C;
  late TextEditingController jwb3C;
  late TextEditingController jwb4C;
  late TextEditingController jwb5C;

  @override
  void onInit() {
    pertanyaanC = TextEditingController();
    jwb1C = TextEditingController();
    jwb2C = TextEditingController();
    jwb3C = TextEditingController();
    jwb4C = TextEditingController();
    jwb5C = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    pertanyaanC.dispose();
    jwb1C.dispose();
    jwb2C.dispose();
    jwb3C.dispose();
    jwb4C.dispose();
    jwb5C.dispose();
    super.onClose();
  }

  onSave() async {
    try {
      final data = await firestore.collection("users").doc(currentUser).get();
      if (data.exists) {
        final nama = data.get("spesialis");
        print(nama);
      } else {
        print("Dokumen tidak ditemukan");
      }
      if (pertanyaanC.text.isNotEmpty) {
        await firestore
            .collection("quiz")
            .doc(data["spesialis"])
            .collection("quizs")
            .doc()
            .set({
          "pertanyaan": pertanyaanC.text,
          "opsi1": jwb1C.text,
          "opsi2": jwb2C.text,
          "opsi3": jwb3C.text,
          "opsi4": jwb4C.text,
          "opsi5": jwb5C.text,
        });
        pertanyaanC.clear();
        jwb1C.clear();
        jwb2C.clear();
        jwb3C.clear();
        jwb4C.clear();
        jwb5C.clear();
        Get.snackbar("Berhasil", "Kuesioner Berhasil Disimpan");
        Get.to(() => DocQuizListView());
      } else {
        Get.snackbar("Tidak Berhasil", "Pertanyaan Kuesioner harus diisi");
      }
    } catch (err) {
      print(err);
      Get.snackbar("Terjadi Kesalahan", "Kuesioner Tidak Berhasil Disimpan");
    }
  }
}
