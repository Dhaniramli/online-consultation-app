import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_consultation_app/theme.dart';

import '../../controllers/cs_quiz_controller.dart';

class OptionTile extends StatefulWidget {
  String? option, optionSelected, correctAnswer, description, question;
  String? email, spesialis;
  int? index;

  OptionTile({
    super.key,
    this.option,
    this.optionSelected,
    this.description,
    this.correctAnswer,
    this.question,
    this.email,
    this.spesialis,
    this.index,
  });

  @override
  State<OptionTile> createState() => _OptionTileState();
}

class _OptionTileState extends State<OptionTile> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CsQuizController());

    return GestureDetector(
      onTap: () async {
        await controller.sendAnswerToFirestore(
          widget.spesialis!,
          widget.email!,
          widget.question!,
          widget.description!,
          widget.index!,
        );

        setState(() {
          widget.optionSelected = widget.description!;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          children: [
            Container(
              height: 28.0,
              width: 28.0,
              decoration: BoxDecoration(
                color: widget.optionSelected == widget.description
                    ? const Color.fromARGB(255, 34, 204, 40)
                    : Colors.transparent,
                border: Border.all(
                    color: widget.optionSelected == widget.description
                        ? Colors.green.withOpacity(0.7)
                        : Colors.grey,
                    width: 1.4),
                borderRadius: BorderRadius.circular(30),
              ),
              alignment: Alignment.center,
              // child: Text(
              //   widget.option!,
              //   style: TextStyle(
              //       color: widget.description == widget.optionSelected
              //           ? Colors.green.withOpacity(0.7)
              //           : Colors.black),
              // ),
            ),
            const SizedBox(width: 8),
            Text(
              widget.description!,
              style: TextStyle(fontSize: 16.0, color: black),
            )
          ],
        ),
      ),
    );
  }
}
