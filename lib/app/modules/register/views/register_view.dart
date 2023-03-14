import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../theme.dart';
import '../../../../utils/loading_view.dart';
import '../../login/views/login_view.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  // const RegisterView({Key? key}) : super(key: key);
  final String type;
  const RegisterView({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());
    controller.typeC = type;

    Widget fullNameInput() {
      return Container(
        height: 56,
        width: double.infinity,
        margin: const EdgeInsets.only(top: 159),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: containerInputColor),
        child: Center(
          child: TextFormField(
            controller: controller.fullNameC,
            style: textStyleBlack,
            decoration: InputDecoration.collapsed(
                hintText: 'Nama Lengkap',
                hintStyle: textInputColorStyle.copyWith(
                    fontSize: 15, fontWeight: medium)),
          ),
        ),
      );
    }

    Widget usernameInput() {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 56,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: containerInputColor),
        child: Center(
          child: TextFormField(
            controller: controller.usernameC,
            style: textStyleBlack,
            decoration: InputDecoration.collapsed(
                hintText: 'Username',
                hintStyle: textInputColorStyle.copyWith(
                    fontSize: 15, fontWeight: medium)),
          ),
        ),
      );
    }

    Widget noTelpInput() {
      return Container(
        height: 56,
        width: double.infinity,
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: containerInputColor),
        child: Center(
          child: TextFormField(
            controller: controller.noTelponC,
            style: textStyleBlack,
            decoration: InputDecoration.collapsed(
                hintText: 'Nomor Telepon',
                hintStyle: textInputColorStyle.copyWith(
                    fontSize: 15, fontWeight: medium)),
          ),
        ),
      );
    }

    Widget emailInput() {
      return Container(
        height: 56,
        width: double.infinity,
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: containerInputColor),
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
            borderRadius: BorderRadius.circular(8), color: containerInputColor),
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

    Widget buttonDaftar() {
      return Container(
        height: 56,
        width: double.infinity,
        margin: const EdgeInsets.only(top: 55),
        child: TextButton(
          onPressed: () {
            controller.isLoadingC = true;
            controller.register();
          },
          style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: Text('Daftar',
              style:
                  textWhiteStyle.copyWith(fontSize: 19, fontWeight: semiBold)),
        ),
      );
    }

    Widget backMasuk() {
      return Container(
        margin: const EdgeInsets.only(top: 31),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sudah punya akun? ',
              style: textStyleGrey.copyWith(fontSize: 15, fontWeight: semiBold),
            ),
            GestureDetector(
              onTap: () {
                // Get.to(() => LoginView());
                Get.back();
              },
              child: Text(
                'Masuk',
                style: textStylePrimaryColor.copyWith(
                    fontSize: 15, fontWeight: semiBold),
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: bgColor1,
      resizeToAvoidBottomInset: false,
      body: controller.isLoadingC
          ? LoadingView()
          : SafeArea(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Text("${type}"),
                    fullNameInput(),
                    usernameInput(),
                    noTelpInput(),
                    emailInput(),
                    passwordInput(),
                    buttonDaftar(),
                    backMasuk()
                  ],
                ),
              ),
            ),
    );
  }
}
