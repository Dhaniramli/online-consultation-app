import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../theme.dart';
import '../../controllers/cs_quiz_controller.dart';
import 'option_tile.dart';

class QuizPlayTile extends StatefulWidget {
  QuizPlayTile({
    super.key,
    required this.descriptionPlay,
    required this.optionSelectedPlay,
    this.questionPlay,
    this.option1,
    this.option2,
    this.option3,
    this.option4,
    this.option5,
    this.email,
    this.spesialis,
    this.index,
  });

  final String descriptionPlay;
  String optionSelectedPlay = "";
  final String? questionPlay;
  String? option1;
  String? option2;
  String? option3;
  String? option4;
  String? option5;
  String? email, spesialis;
  int? index;

  @override
  State<QuizPlayTile> createState() => _QuizPlayTileState();
}

class _QuizPlayTileState extends State<QuizPlayTile> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CsQuizController());

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${widget.index}. ${widget.questionPlay!}",
            style: textStyleBlack.copyWith(fontSize: 18),
          ),
          const SizedBox(height: 10),
          widget.option1 != ""
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.optionSelectedPlay = widget.option1!;
                    });
                  },
                  child: OptionTile(
                    question: widget.questionPlay,
                    description: widget.option1,
                    option: "A",
                    optionSelected: widget.optionSelectedPlay,
                    email: widget.email,
                    spesialis: widget.spesialis,
                    index: widget.index,
                  ),
                )
              : const SizedBox(),
          const SizedBox(height: 4.0),
          widget.option2 != ""
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.optionSelectedPlay = widget.option2!;
                    });
                  },
                  child: OptionTile(
                    question: widget.questionPlay,
                    description: widget.option2,
                    option: "B",
                    optionSelected: widget.optionSelectedPlay,
                    email: widget.email,
                    spesialis: widget.spesialis,
                    index: widget.index,
                  ),
                )
              : const SizedBox(),
          const SizedBox(height: 4.0),
          widget.option3 != ""
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.optionSelectedPlay = widget.option3!;
                    });
                  },
                  child: OptionTile(
                    question: widget.questionPlay,
                    description: widget.option3,
                    option: "C",
                    optionSelected: widget.optionSelectedPlay,
                    email: widget.email,
                    spesialis: widget.spesialis,
                    index: widget.index,
                  ),
                )
              : const SizedBox(),
          const SizedBox(height: 4.0),
          widget.option4 != ""
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.optionSelectedPlay = widget.option4!;
                    });
                  },
                  child: OptionTile(
                    question: widget.questionPlay,
                    description: widget.option4,
                    option: "D",
                    optionSelected: widget.optionSelectedPlay,
                    email: widget.email,
                    spesialis: widget.spesialis,
                    index: widget.index,
                  ),
                )
              : const SizedBox(),
          const SizedBox(height: 4.0),
          widget.option5 != ""
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.optionSelectedPlay = widget.option5!;
                    });
                  },
                  child: OptionTile(
                    question: widget.questionPlay,
                    description: widget.option5,
                    option: "E",
                    optionSelected: widget.optionSelectedPlay,
                    email: widget.email,
                    spesialis: widget.spesialis,
                    index: widget.index,
                  ),
                )
              : const SizedBox(),
          const SizedBox(height: 10.0),
        ],
      ),
    );
  }
}
