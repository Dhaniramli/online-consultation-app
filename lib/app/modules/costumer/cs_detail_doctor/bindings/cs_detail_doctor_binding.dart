import 'package:get/get.dart';

import '../controllers/cs_detail_doctor_controller.dart';

class CsDetailDoctorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CsDetailDoctorController>(
      () => CsDetailDoctorController(),
    );
  }
}
