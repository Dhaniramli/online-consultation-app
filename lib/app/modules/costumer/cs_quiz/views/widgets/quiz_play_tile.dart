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

class _QuizPlayTileState extends State<QuizPlayTile>
    with AutomaticKeepAliveClientMixin<QuizPlayTile> {
  String? lastOptionSelected;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CsQuizController());

    super.build(context);

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
                      lastOptionSelected = widget.option1!;
                      controller.sendAnswerToFirestore(
                        widget.spesialis.toString(),
                        widget.email.toString(),
                        widget.questionPlay.toString(),
                        lastOptionSelected.toString(),
                        widget.index!,
                      );
                    });
                    widget.optionSelectedPlay = widget.option1!;
                  },
                  child: OptionTile(
                    question: widget.questionPlay,
                    description: widget.option1,
                    index: widget.index,
                    isSelected: lastOptionSelected == widget.option1,
                  ),
                )
              : const SizedBox(),
          const SizedBox(height: 4.0),
          widget.option2 != ""
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      lastOptionSelected = widget.option2;
                      controller.sendAnswerToFirestore(
                        widget.spesialis.toString(),
                        widget.email.toString(),
                        widget.questionPlay.toString(),
                        lastOptionSelected.toString(),
                        widget.index!,
                      );
                    });
                    widget.optionSelectedPlay = widget.option2!;
                  },
                  child: OptionTile(
                    question: widget.questionPlay,
                    description: widget.option2,
                    index: widget.index,
                    isSelected: lastOptionSelected == widget.option2,
                  ),
                )
              : const SizedBox(),
          const SizedBox(height: 4.0),
          widget.option3 != ""
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      lastOptionSelected = widget.option3;
                      controller.sendAnswerToFirestore(
                        widget.spesialis.toString(),
                        widget.email.toString(),
                        widget.questionPlay.toString(),
                        lastOptionSelected.toString(),
                        widget.index!,
                      );
                    });
                    widget.optionSelectedPlay = widget.option3!;
                  },
                  child: OptionTile(
                    question: widget.questionPlay,
                    description: widget.option3,
                    index: widget.index,
                    isSelected: lastOptionSelected == widget.option3,
                  ),
                )
              : const SizedBox(),
          const SizedBox(height: 4.0),
          widget.option4 != ""
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      lastOptionSelected = widget.option4;
                      controller.sendAnswerToFirestore(
                        widget.spesialis.toString(),
                        widget.email.toString(),
                        widget.questionPlay.toString(),
                        lastOptionSelected.toString(),
                        widget.index!,
                      );
                    });
                    widget.optionSelectedPlay = widget.option4!;
                  },
                  child: OptionTile(
                    question: widget.questionPlay,
                    description: widget.option4,
                    index: widget.index,
                    isSelected: lastOptionSelected == widget.option4,
                  ),
                )
              : const SizedBox(),
          const SizedBox(height: 4.0),
          widget.option5 != ""
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      lastOptionSelected = widget.option5;
                      controller.sendAnswerToFirestore(
                        widget.spesialis.toString(),
                        widget.email.toString(),
                        widget.questionPlay.toString(),
                        lastOptionSelected.toString(),
                        widget.index!,
                      );
                    });
                    widget.optionSelectedPlay = widget.option5!;
                  },
                  child: OptionTile(
                    question: widget.questionPlay,
                    description: widget.option5,
                    index: widget.index,
                    isSelected: lastOptionSelected == widget.option5,
                  ),
                )
              : const SizedBox(),
          const SizedBox(height: 10.0),
        ],
      ),
    );
  }
}
