import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:online_consultation_app/app/data/app_session.dart';

import '../../../../theme.dart';
import '../controllers/change_pass_controller.dart';

class ChangePassView extends GetView<ChangePassController> {
  const ChangePassView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChangePassController());

    PreferredSize header() {
      return PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: primaryColor,
          title: Text(
            'Ubah Kata Sandi',
            style: textWhiteStyle.copyWith(fontSize: 19, fontWeight: semiBold),
          ),
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Image.asset(
                'assets/picture/panah_kiri.png',
                width: 30,
                height: 30,
              )),
        ),
      );
    }

    Widget content() {
      return Column(
        children: [
          Container(
            height: 56,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: containerInputColor,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [BoxShadow(blurRadius: 1.5, color: textGreyColor)]),
            child: TextFormField(
              controller: controller.oldPasswordC,
              style: textStyleBlack.copyWith(fontSize: 15, fontWeight: medium),
              obscureText: true,
              decoration: InputDecoration.collapsed(
                  hintText: 'Kata Sandi Lama',
                  hintStyle:
                      textStyleGrey.copyWith(fontSize: 15, fontWeight: medium)),
            ),
          ),
          const SizedBox(height: 15),
          Container(
            height: 56,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: containerInputColor,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [BoxShadow(blurRadius: 1.5, color: textGreyColor)]),
            child: TextFormField(
              controller: controller.newPasswordC,
              style: textStyleBlack.copyWith(fontSize: 15, fontWeight: medium),
              obscureText: true,
              decoration: InputDecoration.collapsed(
                  hintText: 'Kata Sandi Baru',
                  hintStyle:
                      textStyleGrey.copyWith(fontSize: 15, fontWeight: medium)),
            ),
          ),
          const SizedBox(height: 30),
          Container(
            height: 56,
            width: double.infinity,
            margin: const EdgeInsets.only(top: 20),
            child: TextButton(
              onPressed: () {
                controller.changePass();
              },
              style: TextButton.styleFrom(
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: Text(
                'Ubah',
                style:
                    textWhiteStyle.copyWith(fontSize: 19, fontWeight: semiBold),
              ),
            ),
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: bgColor1,
      appBar: header(),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: content(),
      ),
    );
  }
}
