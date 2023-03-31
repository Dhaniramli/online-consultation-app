import 'package:get/get.dart';

import '../controllers/doc_my_profile_controller.dart';

class DocMyProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DocMyProfileController>(
      () => DocMyProfileController(),
    );
  }
}
