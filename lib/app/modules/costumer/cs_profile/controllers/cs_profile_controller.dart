import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';

class CsProfileController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> logOut() async {
    await _auth.signOut();
    Get.offAllNamed(Routes.SELECTUSERS);
  }
}
