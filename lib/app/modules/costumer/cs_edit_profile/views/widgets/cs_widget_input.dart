import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../../../theme.dart';

class CsWidgetInput extends StatefulWidget {
  CsWidgetInput({
    super.key,
    this.label,
    this.controlC,
    this.typeInputan,
    this.formatter,
  });

  String? label;
  TextEditingController? controlC;
  TextInputType? typeInputan;
  List<TextInputFormatter>? formatter;

  @override
  State<CsWidgetInput> createState() => _CsWidgetInputState();
}

class _CsWidgetInputState extends State<CsWidgetInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: containerInputColor),
      child: Center(
        child: TextFormField(
          controller: widget.controlC,
          keyboardType: widget.typeInputan,
          inputFormatters: widget.formatter,
          style: textStyleBlack.copyWith(fontSize: 16, fontWeight: semiBold),
          decoration: InputDecoration.collapsed(
              hintText: widget.label,
              hintStyle: textInputColorStyle.copyWith(
                  fontSize: 16, fontWeight: semiBold)),
        ),
      ),
    );
  }
}
