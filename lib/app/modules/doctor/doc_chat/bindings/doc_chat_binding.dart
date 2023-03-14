import 'package:get/get.dart';

import '../controllers/doc_chat_controller.dart';

class DocChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DocChatController>(
      () => DocChatController(),
    );
  }
}
