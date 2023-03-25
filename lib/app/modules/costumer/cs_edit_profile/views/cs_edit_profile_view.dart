import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../../theme.dart';
import 'cs_button_row.dart';
import '../controllers/cs_edit_profile_controller.dart';

class CsEditProfileView extends StatefulWidget {
  String emailV;
  Map<String, dynamic> item;

  CsEditProfileView({super.key, required this.emailV, required this.item});

  @override
  State<CsEditProfileView> createState() => _CsEditProfileView();
}

class _CsEditProfileView extends State<CsEditProfileView> {
  // final controller = Get.find<CsEditProfileController>();
  final controller = Get.put(CsEditProfileController());

  @override
  Widget build(BuildContext context) {
    controller.emailC = widget.emailV;
    // controller.itemC = widget.item["fullName"];

    PreferredSize header() {
      return PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: primaryColor,
          title: Text(
            'Ubah Data Pribadi',
            style: textWhiteStyle.copyWith(fontSize: 19, fontWeight: semiBold),
          ),
        ),
      );
    }

    Widget content() {
      return ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            color: white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 56,
                  padding:
                      const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: containerInputColor),
                  child: Center(
                    child: TextFormField(
                      controller: controller.fullNameC,
                      style: textStyleBlack.copyWith(
                          fontSize: 16, fontWeight: semiBold),
                      decoration: InputDecoration.collapsed(
                          hintText: 'Nama Lengkap',
                          hintStyle: textInputColorStyle.copyWith(
                              fontSize: 16, fontWeight: semiBold)),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  height: 56,
                  padding:
                      const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: containerInputColor),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: controller.dateC,
                          onTap: () async {
                            DateTime? pickeddate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1950),
                                lastDate: DateTime(2100));

                            if (pickeddate != null) {
                              setState(() {
                                controller.dateC.text =
                                    DateFormat('dd/MM/yyyy').format(pickeddate);
                              });
                            }
                          },
                          style: textStyleBlack.copyWith(
                              fontSize: 16, fontWeight: semiBold),
                          decoration: InputDecoration.collapsed(
                              hintText: 'Date',
                              hintStyle: textInputColorStyle.copyWith(
                                  fontSize: 16, fontWeight: semiBold)),
                        ),
                      ),
                      const Spacer(),
                      Image.asset('assets/picture/calendar.png')
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  'Jenis Kelamin',
                  style: textStyleBlack.copyWith(fontSize: 16),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CsButtonRow(
                      text: 'Laki - Laki',
                      value: 1,
                      groupValue: controller.valueC,
                      onChanged: (int? value) {
                        setState(() {
                          controller.valueC = value!;
                        });
                      },
                    ),
                    const SizedBox(width: 10),
                    CsButtonRow(
                      text: 'Perempuan',
                      value: 2,
                      groupValue: controller.valueC,
                      onChanged: (int? value) {
                        setState(() {
                          controller.valueC = value!;
                        });
                      },
                    )
                  ],
                ),
                const SizedBox(height: 15),
                Container(
                  height: 56,
                  padding:
                      const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: containerInputColor),
                  child: Center(
                    child: TextFormField(
                      controller: controller.kotaC,
                      style: textStyleBlack.copyWith(
                          fontSize: 16, fontWeight: semiBold),
                      decoration: InputDecoration.collapsed(
                          hintText: 'Kota/Kabupaten',
                          hintStyle: textInputColorStyle.copyWith(
                              fontSize: 16, fontWeight: semiBold)),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  height: 56,
                  padding:
                      const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: containerInputColor),
                  child: Center(
                    child: TextFormField(
                      controller: controller.noTelponC,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                      ],
                      style: textStyleBlack.copyWith(
                          fontSize: 16, fontWeight: semiBold),
                      decoration: InputDecoration.collapsed(
                          hintText: 'No. HP',
                          hintStyle: textInputColorStyle.copyWith(
                              fontSize: 16, fontWeight: semiBold)),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      controller.onUpdate();
                    },
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 19),
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Simpan',
                      style: textWhiteStyle.copyWith(
                          fontSize: 15, fontWeight: semiBold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: bgColor1,
      appBar: header(),
      body: content(),
    );
  }
}
