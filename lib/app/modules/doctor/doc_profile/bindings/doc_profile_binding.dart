import 'package:get/get.dart';

import '../controllers/doc_profile_controller.dart';

class DocProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DocProfileController>(
      () => DocProfileController(),
    );
  }
}
