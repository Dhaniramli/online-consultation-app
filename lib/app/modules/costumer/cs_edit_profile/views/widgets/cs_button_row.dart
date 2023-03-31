import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../theme.dart';
import '../../controllers/cs_edit_profile_controller.dart';

const Color containers = Color(0xffECF2FF);
const Color containerP = Color(0xff585CE5);

class CsButtonRow extends StatefulWidget {
  final String text;
  final int value;
  final int groupValue;
  final Color container;
  final Color selectColor;
  void Function(int?)? onChanged;
  CsButtonRow(
      {Key? key,
      required this.text,
      required this.value,
      required this.groupValue,
      this.container = containers,
      this.selectColor = containerP,
      this.onChanged})
      : super(key: key);

  @override
  State<CsButtonRow> createState() => _CsButtonRowState();
}

class _CsButtonRowState extends State<CsButtonRow> {
  final controller = Get.put(CsEditProfileController());

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
          onPressed: () {
            bool selected = widget.value != widget.groupValue;
            if (selected) {
              widget.onChanged!(widget.value);
              controller.setGender(widget.value);
            }
          },
          style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 19),
              backgroundColor: widget.value == widget.groupValue
                  ? widget.selectColor
                  : widget.container,
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
          child: Text(
            widget.text,
            style: widget.value == widget.groupValue
                ? textWhiteStyle.copyWith(fontSize: 16, fontWeight: semiBold)
                : textStyleGrey.copyWith(fontSize: 16, fontWeight: semiBold),
          )),
    );
  }
}
