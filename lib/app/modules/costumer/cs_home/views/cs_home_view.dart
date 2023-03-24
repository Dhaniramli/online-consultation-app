import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../theme.dart';
import '../../cs_select_doctor/views/cs_select_doctor_view.dart';
import '../controllers/cs_home_controller.dart';

class CsHomeView extends GetView<CsHomeController> {
  const CsHomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CsHomeController());

    Widget cariDokter() {
      return Container(
        height: 56,
        margin: const EdgeInsets.only(top: 25),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
            color: containerInputColor, borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: controller.searchC,
                onChanged: (value) => controller.searchDoctor(value),
                onFieldSubmitted: (value) {
                  controller.searchDoctor(value);
                },
                style: textStyleBlack,
                decoration: InputDecoration.collapsed(
                    hintText: 'Cari nama dokter atau spesialis',
                    hintStyle: textInputColorStyle.copyWith(
                        fontSize: 15, fontWeight: medium)),
              ),
            ),
            // Spacer(),
            GestureDetector(
              onTap: () {},
              child: Image.asset(
                'assets/picture/icon_search.png',
                width: 25,
              ),
            ),
          ],
        ),
      );
    }

    Widget recomedTitle() {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        child: Text(
          'Rekomendasi Dokter',
          style: textStyleBlack.copyWith(fontSize: 19, fontWeight: semiBold),
        ),
      );
    }

    Widget recomendDokter() {
      return Expanded(
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("users")
              .where('type', isEqualTo: 'doctor')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) return const Text("Error");
            if (snapshot.data == null) return Container();
            if (snapshot.data!.docs.isEmpty) {
              return const Text("No Data");
            }
            final data = snapshot.data!;
            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              itemCount: data.docs.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> item =
                    (data.docs[index].data() as Map<String, dynamic>);
                item["id"] = data.docs[index].id;
                return Container(
                  width: double.infinity,
                  color: bgColor1,
                  child: CsSelectDoctorView(
                    doctorName: "${item["fullName"]}",
                    specialist: "${item["email"]}",
                    email: "${item["email"]}",
                  ),
                );
              },
            );
          },
        ),
      );
    }

    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [cariDokter(), recomedTitle(), recomendDokter()],
        ),
      ),
    );
  }
}
