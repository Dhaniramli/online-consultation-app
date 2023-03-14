import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:online_consultation_app/theme.dart';
import '../../login/views/login_view.dart';
import '../controllers/selectusers_controller.dart';

class SelectusersView extends GetView<SelectusersController> {
  const SelectusersView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool confirmExit = await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Konfirmasi'),
            content:
                const Text('Apakah Anda yakin ingin keluar dari aplikasi?'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('Tidak'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('Ya'),
              ),
            ],
          ),
        );
        return confirmExit;
      },
      child: Scaffold(
        backgroundColor: primaryColor,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Container(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Masuk Sebagai",
                    style: textWhiteStyle.copyWith(
                      fontSize: 21,
                      fontWeight: FontWeight.w600,
                    )),
                const SizedBox(height: 26),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Get.to(LoginView());
                        Get.to(() => const LoginView(
                              type: "patient",
                            ));
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 100.0,
                            width: 100.0,
                            padding: const EdgeInsets.all(25.0),
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Image.asset(
                              "assets/picture/pasien.png",
                              width: 50.0,
                              height: 50.0,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text("Pasien",
                              style: textWhiteStyle.copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              )),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {
                        // Get.to(LoginView());
                        Get.to(() => const LoginView(
                              type: "doctor",
                            ));
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 100.0,
                            width: 100.0,
                            padding: const EdgeInsets.all(25.0),
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Image.asset(
                              "assets/picture/doctor.png",
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text("Apoteker",
                              style: textWhiteStyle.copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              )),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
