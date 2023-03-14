import 'package:get/get.dart';

import '../controllers/doc_home_controller.dart';

class DocHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DocHomeController>(
      () => DocHomeController(),
    );
  }
}
