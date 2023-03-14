import 'package:get/get.dart';

import '../controllers/doc_main_navigation_controller.dart';

class DocMainNavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DocMainNavigationController>(
      () => DocMainNavigationController(),
    );
  }
}
