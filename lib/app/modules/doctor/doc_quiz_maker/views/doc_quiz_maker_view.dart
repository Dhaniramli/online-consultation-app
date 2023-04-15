import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../theme.dart';
import '../controllers/doc_quiz_maker_controller.dart';
import 'widgets/answer_option.dart';

class DocQuizMakerView extends GetView<DocQuizMakerController> {
  const DocQuizMakerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DocQuizMakerController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kuesioner'),
        backgroundColor: primaryColor,
        centerTitle: true,
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
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(),
                child: TextFormField(
                  controller: controller.pertanyaanC,
                  decoration: InputDecoration(
                    labelText: 'Pertanyaan',
                    labelStyle: textStylePrimaryColor.copyWith(
                      color: primaryColor,
                      fontSize: 15,
                    ),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueGrey,
                      ),
                    ),
                    helperText: "Masukkan pertanyaan Kuesioner",
                  ),
                ),
              ),
              AnswerOption(
                titleV: 'Jawaban Opsi 1',
                controllerV: controller.jwb1C,
              ),
              AnswerOption(
                titleV: 'Jawaban Opsi 2',
                controllerV: controller.jwb2C,
              ),
              AnswerOption(
                titleV: 'Jawaban Opsi 3',
                controllerV: controller.jwb3C,
              ),
              AnswerOption(
                titleV: 'Jawaban Opsi 4',
                controllerV: controller.jwb4C,
              ),
              AnswerOption(
                titleV: 'Jawaban Opsi 5',
                controllerV: controller.jwb5C,
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => controller.onSave(),
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 19),
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Simpan',
                    style: textWhiteStyle.copyWith(
                        fontSize: 15, fontWeight: semiBold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
