import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../theme.dart';
import '../../../../routes/app_pages.dart';
import '../../cs_quiz/views/cs_quiz_view.dart';
import '../controllers/cs_detail_doctor_controller.dart';

class CsDetailDoctorView extends GetView<CsDetailDoctorController> {
  Map<String, dynamic>? userMap;
  String? emailDetail;

  CsDetailDoctorView({super.key, this.userMap, this.emailDetail});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CsDetailDoctorController());
    controller.namaDokterC = userMap?['fullName'];
    controller.userMap = userMap;

    PreferredSize header() {
      return PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: primaryColor,
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

    Widget pictDokter() {
      return Container(
        height: 316,
        width: double.infinity,
        decoration: BoxDecoration(color: bgColor1, boxShadow: [
          BoxShadow(
              color: black.withOpacity(0.2),
              blurRadius: 2.0,
              offset: const Offset(0.0, 1.0))
        ]),
        child: Column(
          children: [
            const SizedBox(height: 13),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: userMap?['photo'] != ""
                  ? Image.network(
                      "${userMap?['photo']}",
                      width: 225.0,
                      height: 225.0,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      'assets/picture/dokter.png',
                      width: 225.0,
                      height: 225.0,
                    ),
            ),
            const SizedBox(height: 19),
            Text(
              userMap?['fullName'],
              style:
                  textStyleBlack.copyWith(fontSize: 19, fontWeight: semiBold),
            ),
            const SizedBox(height: 5),
            Text(
              userMap?['spesialis'] != ""
                  ? "Spesialis ${userMap?['spesialis']}"
                  : "Spesialis...",
              style: textStyleGrey.copyWith(fontSize: 16, fontWeight: semiBold),
            )
          ],
        ),
      );
    }

    Widget statusDokter() {
      return GestureDetector(
        onTap: () {},
        child: Container(
          margin: const EdgeInsets.only(top: 25, left: 15, right: 15),
          child: Column(
            children: [
              Container(
                height: 100,
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 0,
                          blurRadius: 1.5,
                          offset: const Offset(0, 0))
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Riwayat Pendidikan',
                      style: textStyleBlack.copyWith(
                          fontSize: 16, fontWeight: semiBold),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "${userMap?['pendidikanTerakhir']}",
                      style: textStyleBlack.copyWith(fontSize: 15),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '2019',
                      style: textStyleBlack.copyWith(fontSize: 15),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 15),
              // Container(
              //   height: 100,
              //   width: double.infinity,
              //   padding: const EdgeInsets.all(15),
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(8),
              //       color: white,
              //       boxShadow: [
              //         BoxShadow(
              //             color: Colors.black.withOpacity(0.2),
              //             spreadRadius: 0,
              //             blurRadius: 1.5,
              //             offset: const Offset(0, 0))
              //       ]),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Text(
              //         'Tempat Praktik',
              //         style: textStyleBlack.copyWith(
              //             fontSize: 16, fontWeight: semiBold),
              //       ),
              //       const SizedBox(height: 10),
              //       Text(
              //         // 'Praktek Mandiri Dr. Ronald Richard, Makassar',
              //         userMap?['fullName'],
              //         style: textStyleBlack.copyWith(fontSize: 15),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      );
    }

    Widget footer() {
      return Container(
        height: 70,
        padding: const EdgeInsets.all(15),
        width: double.infinity,
        decoration: BoxDecoration(
          color: white,
          boxShadow: [
            BoxShadow(
                color: textGreyColor,
                blurRadius: 2.0,
                offset: const Offset(0.0, 1.0))
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Biaya Konsultasi',
                    style: textStyleBlack.copyWith(
                      fontSize: 11,
                      fontWeight: medium,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Rp 45.000',
                    style: textStyleOrange.copyWith(
                        fontSize: 19, fontWeight: semiBold),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 44,
              width: 150,
              child: TextButton(
                onPressed: () {
                  // controller.selectUser();
                  Get.to(() => CsQuizView(userMap: userMap));
                },
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  backgroundColor: orangen,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: Text(
                  'Chat Sekarang',
                  style: textWhiteStyle.copyWith(
                      fontSize: 15, fontWeight: semiBold),
                ),
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: bgColor1,
      appBar: header(),
      body: ListView(
        children: [
          pictDokter(),
          statusDokter(),
        ],
      ),
      bottomNavigationBar: footer(),
    );
  }
}
