import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_consultation_app/theme.dart';
import '../controllers/cs_quiz_controller.dart';

class CsQuizView extends StatefulWidget {
  const CsQuizView({
    super.key,
    this.userMap,
  });

  final Map<String, dynamic>? userMap;

  @override
  State<CsQuizView> createState() => _CsQuizViewState();
}

class _CsQuizViewState extends State<CsQuizView> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Survey'),
      ),
      body: StreamBuilder(
        stream: firestore.collection('surveys').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          List<DocumentSnapshot> surveys = snapshot.data!.docs;

          return ListView.builder(
            itemCount: surveys.length,
            itemBuilder: (context, index) {
              final survey = surveys[index].data();
              print("Survey $survey");

              return Container(
                margin: const EdgeInsets.all(16),
                // child: Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Text(
                //       survey?['question'],
                //       style: const TextStyle(
                //         fontWeight: FontWeight.bold,
                //         fontSize: 16,
                //       ),
                //     ),
                //     const SizedBox(height: 8),
                //     Column(
                //       children: List<Widget>.from(survey['options']?.map((option) {
                //         return RadioListTile(
                //           title: Text(option ?? ''),
                //           value: option,
                //           groupValue: survey['selectedOption'],
                //           onChanged: (value) {
                //             firestore.collection('surveys').doc(surveys[index].id).update({
                //               'selectedOption': value,
                //             });
                //           },
                //         );
                //       }) ?? []),
                //     ),
                //   ],
                // ),
              );
            },
          );
        },
      ),
    );
  }
}
