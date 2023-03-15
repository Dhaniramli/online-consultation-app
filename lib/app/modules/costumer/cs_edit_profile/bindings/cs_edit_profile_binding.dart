import 'package:get/get.dart';

import '../controllers/cs_edit_profile_controller.dart';

class CsEditProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CsEditProfileController>(
      () => CsEditProfileController(),
    );
  }
}
