import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../theme.dart';
import '../../../doc_quiz_list/views/doc_quiz_list_view.dart';
import '../../../doc_quiz_maker/views/doc_quiz_maker_view.dart';

class DocButtonHome extends StatelessWidget {
  const DocButtonHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => DocQuizListView()),
      child: Container(
        height: 120.0,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        width: Get.width / 3.55,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Kuesioner",
              style: textWhiteStyle.copyWith(
                fontSize: 15,
                fontWeight: bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
