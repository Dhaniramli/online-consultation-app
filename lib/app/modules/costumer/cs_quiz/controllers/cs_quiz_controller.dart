import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class CsQuizController extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  late String namaDokterC;
  Map<String, dynamic>? userMap;
  late String roomId;
  late String selectedOption;
  List<String?> selectedOptions = [];

  Stream<QuerySnapshot<Map<String, dynamic>>> spesialisData(String spesialis) {
    return firestore
        .collection("quiz")
        .doc(spesialis)
        .collection("quizs")
        .snapshots();
  }

  @override
  void onInit() {
    super.onInit();
    selectedOption = "";
  }

  @override
  void onClose() {
    super.onClose();
  }
}
