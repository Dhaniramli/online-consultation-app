import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../theme.dart';
import '../../../../data/app_session.dart';
import '../../doc_main_navigation/views/doc_main_navigation_view.dart';
import '../../doc_quiz_maker/views/doc_quiz_maker_view.dart';
import '../controllers/doc_quiz_list_controller.dart';
import 'widgets/doc_card.dart';

class DocQuizListView extends GetView<DocQuizListController> {
  const DocQuizListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DocQuizListController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kuesioner'),
        backgroundColor: primaryColor,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.offAll(() => DocMainNavigationView());
              // Get.back();
            },
            icon: Image.asset(
              'assets/picture/panah_kiri.png',
              width: 30,
              height: 30,
            )),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: controller.firestore
                    .collection("quiz")
                    .doc("Hipertensi")
                    .collection("quizs")
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) return const Text("Error");
                  if (snapshot.data == null) return Container();
                  if (snapshot.data!.docs.isEmpty) {
                    return const Center(child: Text("No Data"));
                  }
                  final data = snapshot.data!;
                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    itemCount: data.docs.length,
                    itemBuilder: (context, index) {
                      Map<String, dynamic> item =
                          (data.docs[index].data() as Map<String, dynamic>);
                      item["id"] = data.docs[index].id;
                      return Container(
                        width: double.infinity,
                        color: bgColor1,
                        child: DocCard(
                          pertanyaanV: "${item["pertanyaan"]}",
                          idV: item["id"],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => DocQuizMakerView()),
        backgroundColor: primaryColor,
        child: const Icon(
          Icons.add,
          color: white,
          size: 30,
        ),
      ),
    );
  }
}
