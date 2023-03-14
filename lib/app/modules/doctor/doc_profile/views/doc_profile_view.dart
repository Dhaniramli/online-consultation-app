import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../theme.dart';
import '../controllers/doc_profile_controller.dart';

class DocProfileView extends GetView<DocProfileController> {
  const DocProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DocProfileController());
    
    Widget header(){
      return Container(
        padding: const EdgeInsets.all(20),
        height: 120,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: white,
          boxShadow: [
            BoxShadow(
                  color: Colors.black26,
                  blurRadius: 1.0,
                  spreadRadius: 1.0,
                  offset: Offset(0.0, 1.0),
                ),
          ]
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.asset(
                'assets/picture/dokter.png',
                width: 80,
              ),
            ),
            const SizedBox(width: 15),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Thomas Patrey',
                  style: textStyleBlack.copyWith(
                    fontSize: 19,
                    fontWeight: semiBold
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  '085-993-223-443',
                  style: textStyleGrey.copyWith(
                    fontSize: 16
                  ),
                )
              ],
            )
          ],
        ),
      );
    }

    Widget profileSaya(){
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, 'profileSaya');
        },
        child: Container(
          height: 60,
          margin: const EdgeInsets.only(
            top: 20,
            left: 15,
            right: 15
          ),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: white,
            boxShadow: [
              BoxShadow(
                blurRadius: 0.5,
                color: black
              )
            ]
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Profil Saya',
                style: textStyleBlack.copyWith(
                  fontSize: 15,
                  fontWeight: medium
                ),
              ),
              Image.asset(
                'assets/picture/icon_panah.png',
                width: 50,
              )

            ],
          ),
        ),
      );
    }
    Widget ubahSandi(){
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, 'editSandi');
        },
        child: Container(
          height: 60,
          margin: const EdgeInsets.only(
            top: 20,
            left: 15,
            right: 15
          ),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: white,
            boxShadow: [
              BoxShadow(
                blurRadius: 0.5,
                color: black
              )
            ]
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Ubah Kata Sandi',
                style: textStyleBlack.copyWith(
                  fontSize: 15,
                  fontWeight: medium
                ),
              ),
              Image.asset(
                'assets/picture/icon_panah.png',
                width: 50,
              )

            ],
          ),
        ),
      );
    }

    Widget keluar(){
      return GestureDetector(
        onTap: () {
          controller.logOut();
        },
        child: Container(
          height: 60,
          margin: const EdgeInsets.only(
            top: 20,
            left: 15,
            right: 15
          ),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: white,
            boxShadow: [
              BoxShadow(
                blurRadius: 0.5,
                color: black
              )
            ]
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Keluar',
                style: textStyleBlack.copyWith(
                  fontSize: 15,
                  fontWeight: medium
                ),
              ),
              Image.asset(
                'assets/picture/keluar.png',
                width: 50,
              )

            ],
          ),
        ),
      );
    }

    return SafeArea(
      child: Column(
        children: [
          header(),
          profileSaya(),
          ubahSandi(),
          keluar()
        ],
      ),
    );

  }
}
