import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:online_consultation_app/app/routes/app_pages.dart';

class AuthController extends GetxController {
  // var isSkipintro = false.obs;
  // var isAuth = false.obs;

  // String email = "";
  // String password = "";
  // FirebaseAuth _currentUser = FirebaseAuth.instance;
  // Future<void> logIn() async {
  //   try {
  //     await FirebaseAuth.instance
  //         .createUserWithEmailAndPassword(
  //           email: email,
  //           password: password,
  //         )
  //         .then((value) => _currentUser = value as FirebaseAuth);

  //     await _currentUser.authStateChanges().listen((User? user) {
  //       if (user == null) {
  //         // user belum login
  //         print("User Belum login");
  //       } else {
  //         // user sudah login
  //         print("User Sudah berhasil login");
  //         isAuth.value = true;
  //       }
  //     });

  //     print(_currentUser);
  //   } catch (err) {
  //     print(err);
  //   }
  // }

  // Future<void> logOut() async {
  //   await _currentUser.signOut();
  //   Get.offAllNamed(Routes.LOGIN);
  // }
}
