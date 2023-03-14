import 'package:get/get.dart';

import '../controllers/cs_profile_controller.dart';

class CsProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CsProfileController>(
      () => CsProfileController(),
    );
  }
}
