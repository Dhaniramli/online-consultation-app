import 'package:flutter/material.dart';

import '../../../../../../theme.dart';

class AnswerOption extends StatelessWidget {
  AnswerOption({
    super.key,
    required this.titleV,
    required this.controllerV,
  });

  String titleV;
  TextEditingController controllerV;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: titleV,
          labelStyle: textStylePrimaryColor.copyWith(
            color: primaryColor,
            fontSize: 15,
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blueGrey,
            ),
          ),
          helperText: "Masukkan opsi jawaban Kuesioner",
        ),
        // onChanged: (value) {},
        controller: controllerV,
      ),
    );
  }
}
