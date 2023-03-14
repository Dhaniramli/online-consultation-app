import 'package:get/get.dart';

import '../controllers/cs_detail_controller.dart';

class CsDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CsDetailController>(
      () => CsDetailController(),
    );
  }
}
