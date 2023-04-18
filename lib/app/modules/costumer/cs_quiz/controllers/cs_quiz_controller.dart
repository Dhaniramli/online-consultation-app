import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:online_consultation_app/app/data/app_session.dart';

import '../../../chat_room/views/chat_room_view.dart';

class CsQuizController extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  late String namaDokterC;
  Map<String, dynamic>? userMap;
  late String roomId;
  late String selectedOption;
  List<String?> selectedOptions = [];

  late String option1;
  late String option2;
  late String option3;
  late String option4;
  late String option5;
  String optionSelected = "";
  late String question;
  late Stream quizStream;
  late int jumlahData;

  String? option1SelectedPlay;
  String? option2SelectedPlay;
  String? option3SelectedPlay;
  String? option4SelectedPlay;
  String? option5SelectedPlay;

  Stream<QuerySnapshot<Map<String, dynamic>>> spesialisData(String spesialis) {
    return firestore
        .collection("quiz")
        .doc(spesialis)
        .collection("QNA")
        .snapshots();
  }

  doneQuiz(String chatRoomId) async {
    try {
      final querySnapshot = await firestore
          .collection('answers')
          .doc(userMap!["spesialis"])
          .collection(currentUser)
          .get();
      final numOfDocs = querySnapshot.docs.length;

      if (jumlahData == numOfDocs) {
        print("roomID = ${roomId}");
        print("userMap = ${userMap}");
        Get.to(
          () => ChatRoomView(
            userMap: userMap,
            chatRoomid: chatRoomId,
            friendEmail: userMap?["email"],
          ),
        );
      } else {
        Get.snackbar("Terjadi Kesalahan", "Seluruh Kuesioner Harus Terjawab");
      }
    } catch (err) {
      print(err);
      print("TERJADI KESALAHAN DI CS_QUIZ");
    }
  }

  Future<void> sendAnswerToFirestore(String spesialis, String email,
      String question, String answer, int index) async {
    try {
      final docRef = firestore
          .collection('answers')
          .doc(spesialis)
          .collection(email)
          .doc(index.toString());

      final docSnapshot = await docRef.get();

      if (docSnapshot.exists) {
        await docRef.update({
          'pertanyaan': question,
          'jawaban': answer,
        });
        print("data di update");
      } else {
        await docRef.set({
          'pertanyaan': question,
          'jawaban': answer,
        });
        print("data di tambah");
      }
    } catch (e) {
      print(e);
    }
  }

  void setSelectedOption(String oldOption, String newOption) {
    if (oldOption != newOption) {
      optionSelected = newOption;
    }
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
