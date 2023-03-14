import 'package:get/get.dart';

import '../controllers/selectusers_controller.dart';

class SelectusersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SelectusersController>(
      () => SelectusersController(),
    );
  }
}
