import 'package:get/get.dart';

import '../controllers/doc_edit_profile_controller.dart';

class DocEditProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DocEditProfileController>(
      () => DocEditProfileController(),
    );
  }
}
