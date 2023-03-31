import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../../theme.dart';
import '../../../../utils/loading_view.dart';
import '../../register/views/register_view.dart';
import '../../selectusers/views/selectusers_view.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  // const LoginView({Key? key}) : super(key: key);
  final String type;
  const LoginView({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    controller.typeC = type;

    Widget emailInput() {
      return Container(
        height: 56,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            color: containerInputColor, borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: TextFormField(
            controller: controller.emailC,
            style: textStyleBlack,
            decoration: InputDecoration.collapsed(
                hintText: 'Email',
                hintStyle: textInputColorStyle.copyWith(
                    fontSize: 15, fontWeight: medium)),
          ),
        ),
      );
    }

    Widget passwordInput() {
      return Container(
        height: 56,
        width: double.infinity,
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            color: containerInputColor, borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: TextFormField(
            controller: controller.passwordC,
            style: textStyleBlack,
            obscureText: true,
            decoration: InputDecoration.collapsed(
                hintText: 'Password',
                hintStyle: textInputColorStyle.copyWith(
                    fontSize: 15, fontWeight: medium)),
          ),
        ),
      );
    }

    Widget buttonMasuk() {
      return Container(
        height: 56,
        width: double.infinity,
        margin: const EdgeInsets.only(top: 55),
        child: TextButton(
          onPressed: () {
            controller.logIn();
          },
          style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: Text(
            'Masuk',
            style: textWhiteStyle.copyWith(fontSize: 19, fontWeight: semiBold),
          ),
        ),
      );
    }

    Widget regist() {
      return Container(
        margin: const EdgeInsets.only(top: 31),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Belum punya akun? ',
              style: textStyleGrey.copyWith(fontWeight: semiBold, fontSize: 15),
            ),
            GestureDetector(
              onTap: () {
                Get.to(RegisterView(type: type));
              },
              child: Text(
                'Daftar',
                style: textStylePrimaryColor.copyWith(
                    fontWeight: semiBold, fontSize: 15),
              ),
            )
          ],
        ),
      );
    }

    Widget titlePasien() {
      return Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: Text(
          "Masuk Sebagai Pasien",
          style: textStylePrimaryColor.copyWith(
            fontSize: 21.0,
            fontWeight: FontWeight.w800,
          ),
        ),
      );
    }

    Widget titleDokter() {
      return Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: Text(
          "Masuk Sebagai Apoteker",
          style: textStylePrimaryColor.copyWith(
            fontSize: 21.0,
            fontWeight: FontWeight.w800,
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: bgColor1,
      resizeToAvoidBottomInset: false,
      body: controller.isLoadingC == true
          ? LoadingView()
          : SafeArea(
              child: Container(
              margin: const EdgeInsets.only(left: 15, right: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  type == "patient" ? titlePasien() : titleDokter(),
                  emailInput(),
                  passwordInput(),
                  buttonMasuk(),
                  regist()
                ],
              ),
            )),
    );
  }
}
