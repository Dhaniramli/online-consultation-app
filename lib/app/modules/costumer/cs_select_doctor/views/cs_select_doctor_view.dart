import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../theme.dart';
import '../../cs_detail_doctor/views/cs_detail_doctor_view.dart';
import '../controllers/cs_select_doctor_controller.dart';

class CsSelectDoctorView extends StatefulWidget {
  final String doctorName;
  final String specialist;
  final String email;
  final String photo;
  // final double? harga;

  const CsSelectDoctorView({
    super.key,
    required this.doctorName,
    required this.specialist,
    required this.email,
    required this.photo,
    // this.harga,
  });

  @override
  State<CsSelectDoctorView> createState() => _CsSelectDoctorViewState();
}

class _CsSelectDoctorViewState extends State<CsSelectDoctorView> {
  @override
  Widget build(BuildContext context) {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    Map<String, dynamic>? userMap;
    // final controller = Get.put(CsSelectDoctorController());
    // controller.namaDokterC = widget.doctorName;

    return GestureDetector(
      onTap: () async {
        await firestore
            .collection('users')
            .where("fullName", isEqualTo: widget.doctorName)
            .get()
            .then((value) {
          setState(() {
            userMap = value.docs[0].data();
          });
          print(userMap);
        });

        String roomId = userMap?['email'] ?? "";

        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => CsDetailDoctorView(
              userMap: userMap,
              emailDetail: widget.email,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(top: 17),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 0,
              blurRadius: 1.5,
              offset: const Offset(0, 0))
        ], borderRadius: BorderRadius.circular(8), color: white),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: widget.photo != ""
                  ? Image.network(
                      widget.photo,
                      width: 81.0,
                      height: 80.0,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      'assets/picture/dokter.png',
                      width: 81,
                      height: 80,
                    ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.doctorName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: textStyleBlack.copyWith(
                        fontSize: 16, fontWeight: semiBold),
                  ),
                  const SizedBox(height: 10),
                  widget.specialist != ""
                      ? Text(
                          "Spesialis ${widget.specialist}",
                          style: textStyleBlack.copyWith(
                              fontSize: 11, fontWeight: medium),
                        )
                      : Text(
                          "Spesialis...",
                          style: textStyleBlack.copyWith(
                              fontSize: 11, fontWeight: medium),
                        ),
                  const SizedBox(height: 10),
                  Text(
                    'Rp 45.000',
                    style: textStyleOrange.copyWith(
                        fontSize: 13, fontWeight: medium),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
