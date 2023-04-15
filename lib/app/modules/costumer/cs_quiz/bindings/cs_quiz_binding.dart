import 'package:get/get.dart';

import '../controllers/cs_quiz_controller.dart';

class CsQuizBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CsQuizController>(
      () => CsQuizController(),
    );
  }
}
