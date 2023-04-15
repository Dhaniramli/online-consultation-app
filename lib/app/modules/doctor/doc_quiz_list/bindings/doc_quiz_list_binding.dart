import 'package:get/get.dart';

import '../controllers/doc_quiz_list_controller.dart';

class DocQuizListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DocQuizListController>(
      () => DocQuizListController(),
    );
  }
}
