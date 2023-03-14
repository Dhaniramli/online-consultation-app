import 'package:get/get.dart';

import '../controllers/cs_main_navigation_controller.dart';

class CsMainNavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CsMainNavigationController>(
      () => CsMainNavigationController(),
    );
  }
}
