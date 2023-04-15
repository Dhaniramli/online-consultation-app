import 'package:get/get.dart';

import '../controllers/doc_quiz_maker_controller.dart';

class DocQuizMakerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DocQuizMakerController>(
      () => DocQuizMakerController(),
    );
  }
}
