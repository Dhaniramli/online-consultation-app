import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/controllers/auth_controller.dart';
import 'app/modules/login/controllers/login_controller.dart';
import 'app/routes/app_pages.dart';
import 'utils/error_view.dart';
import 'utils/loading_view.dart';
import 'utils/splashscreen_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // options: DefaultFirebaseOptions.currentPlatform,
      );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  final authC = Get.put(LoginController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: ((context, snapshot) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Online Consultation App",
          initialRoute: Routes.SELECTUSERS,
          getPages: AppPages.routes,
        );
        
        // if (snapshot.hasError) {
        //   return ErrorView();
        // }

        // if (snapshot.connectionState == ConnectionState.done) {
        //   return FutureBuilder(
        //     future: Future.delayed(const Duration(seconds: 3)),
        //     builder: (context, snapshot) {
        //       if (snapshot.connectionState == ConnectionState.done) {
        //         return GetMaterialApp(
        //           debugShowCheckedModeBanner: false,
        //           title: "Online Consultation App",
        //           initialRoute: authC.isAuth.isTrue ? Routes.HOME : Routes.SELECTUSERS,
        //           getPages: AppPages.routes,
        //         );
        //       }
        //       return const SplashscreenView();
        //     },
        //   );
        // }

        // return LoadingView();
      }),
    );
  }
}
