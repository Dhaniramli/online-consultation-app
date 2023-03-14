import 'package:get/get.dart';

import '../controllers/cs_my_profile_controller.dart';

class CsMyProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CsMyProfileController>(
      () => CsMyProfileController(),
    );
  }
}
