import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:online_consultation_app/app/data/app_session.dart';

class DocQuizListController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  delete(String uidC) async {
    try {
      var data = await firestore.collection("users").doc(currentUser).get();
      if (data.exists) {
        var nama = data.get("spesialis");
        print(nama);
      } else {
        print("Dokumen tidak ditemukan");
      }

      if (uidC != null) {
        await firestore
            .collection("quiz")
            .doc(data["spesialis"])
            .collection("quizs")
            .doc(uidC)
            .delete();
        Get.snackbar("Berhasil", "Kuesioner Berhasil Dihapus");
      } else {
        Get.snackbar("Tidak Berhasil", "Kuesioner Tidak Berhasil Dihapus");
      }
    } catch (err) {
      Get.snackbar("Terjadi Kesalahan", "Kuesioner Tidak Dapat Dihapus");
    }
  }
}
