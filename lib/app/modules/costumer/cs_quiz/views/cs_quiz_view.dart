import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_consultation_app/app/data/app_session.dart';
import 'package:online_consultation_app/theme.dart';
import '../controllers/cs_quiz_controller.dart';
import 'widgets/option_tile.dart';
import 'widgets/quiz_play_tile.dart';

class CsQuizView extends StatefulWidget {
  CsQuizView({
    super.key,
    required this.userMap,
    required this.chatRoomid,
  });

  final Map<String, dynamic> userMap;
  String chatRoomid;

  @override
  State<CsQuizView> createState() => _CsQuizViewState();
}

class _CsQuizViewState extends State<CsQuizView> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final controller = Get.put(CsQuizController());
  String optionSelected = "";
  String description = "";
  int nomor = 1;

  List<String> options = [];

  @override
  Widget build(BuildContext context) {
    controller.roomId = widget.chatRoomid;
    controller.userMap = widget.userMap;

    Widget content() {
      return Expanded(
        child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: controller.spesialisData(widget.userMap["spesialis"]),
          builder: (context, snapshot) {
            if (snapshot.hasError) return const Text("Error");
            if (snapshot.data == null) return Container();
            if (snapshot.data!.docs.isEmpty) {
              return const Text("No Data");
            }
            final data = snapshot.data!;
            controller.jumlahData = data.docs.length;
            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              itemCount: data.docs.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> item =
                    (data.docs[index].data() as Map<String, dynamic>);
                item["id"] = data.docs[index].id;
                List<String> options = [
                  item['opsi1'] ?? "",
                  item['opsi2'] ?? "",
                  item['opsi3'] ?? "",
                  item['opsi4'] ?? "",
                  item['opsi5'] ?? "",
                ];

                options.shuffle();

                return QuizPlayTile(
                  questionPlay: item['pertanyaan'],
                  descriptionPlay: description,
                  optionSelectedPlay: optionSelected,
                  option1: options[0],
                  option2: options[1],
                  option3: options[2],
                  option4: options[3],
                  option5: options[4],
                  email: currentUser,
                  spesialis: widget.userMap["spesialis"],
                  index: nomor++,
                );
              },
            );
          },
        ),
      );
    }

    Widget buttonKirim() {
      return Container(
        height: 56,
        width: double.infinity,
        margin: const EdgeInsets.only(top: 0, bottom: 10, right: 15, left: 15),
        child: TextButton(
          onPressed: () {
            print("PRINT CHAT ID ${widget.chatRoomid}");
            controller.doneQuiz(widget.chatRoomid);
          },
          style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: Text(
            'Selesai',
            style: textWhiteStyle.copyWith(fontSize: 19, fontWeight: semiBold),
          ),
        ),
      );
    }

    PreferredSize header() {
      return PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: primaryColor,
          title: Text(
            "Kuesioner",
            style: textWhiteStyle.copyWith(fontSize: 19, fontWeight: semiBold),
          ),
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Image.asset(
                'assets/picture/panah_kiri.png',
                width: 30,
                height: 30,
              )),
        ),
      );
    }

    return Scaffold(
      appBar: header(),
      body: Container(
        child: Column(
          children: [
            content(),
            buttonKirim(),
          ],
        ),
      ),
    );
  }
}
