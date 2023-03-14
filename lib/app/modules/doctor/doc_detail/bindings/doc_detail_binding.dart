import 'package:get/get.dart';

import '../controllers/doc_detail_controller.dart';

class DocDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DocDetailController>(
      () => DocDetailController(),
    );
  }
}
