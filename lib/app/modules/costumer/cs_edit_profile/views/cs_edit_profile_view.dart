import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:online_consultation_app/app/data/app_session.dart';
import '../../../../../theme.dart';
import 'widgets/cs_button_row.dart';
import '../controllers/cs_edit_profile_controller.dart';
import 'widgets/cs_dropdown.dart';
import 'widgets/cs_widget_input.dart';

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
      return ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            color: white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => controller.selectImage(),
                  behavior: HitTestBehavior.translucent,
                  child: Container(
                    height: 125,
                    width: Get.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: containerInputColor),
                    child: GetBuilder<CsEditProfileController>(
                      builder: (c) => c.pickedImage != null
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () => controller
                                      .uploadImage(currentUserId)
                                      .then((hasilKembalian) {
                                    if (hasilKembalian != null) {
                                      controller.updatePhotoUrl(hasilKembalian);
                                    }
                                  }),
                                  child: SizedBox(
                                    width: 40.0,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const ImageIcon(
                                          AssetImage(
                                            "assets/picture/upload.png",
                                          ),
                                          size: 25.0,
                                        ),
                                        Text(
                                          "Unggah",
                                          style: textStyleBlack.copyWith(
                                            fontSize: 10,
                                            fontWeight: medium,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 100.0,
                                  width: 100.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(
                                      image: FileImage(
                                        File(c.pickedImage!.path),
                                      ),
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 40.0,
                                  child: IconButton(
                                    onPressed: () => c.deleteImage(),
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Color.fromARGB(255, 206, 14, 0),
                                      size: 25.0,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/picture/upload.png",
                                  width: 40.0,
                                  height: 40.0,
                                  fit: BoxFit.fill,
                                ),
                                Text(
                                  "Pilih Gambar",
                                  style: textStyleBlack.copyWith(
                                      fontSize: 16.0, fontWeight: semiBold),
                                ),
                              ],
                            ),
                    ),
                  ),
                ),
                const SizedBox(height: 15.0),
                CsWidgetInput(
                  label: 'Nama Lengkap',
                  typeInputan: TextInputType.multiline,
                  controlC: controller.fullNameC,
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
                CsWidgetInput(
                  label: 'Kota/Kabupaten',
                  typeInputan: TextInputType.multiline,
                  controlC: controller.kotaC,
                ),
                const SizedBox(height: 15),
                CsWidgetInput(
                  label: "Nomor Telepon",
                  typeInputan: TextInputType.number,
                  controlC: controller.noTelponC,
                  formatter: [
                    FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                  ],
                ),
                const SizedBox(height: 15),
                // CsWidgetInput(
                //   label: "Pendidikan Terakhir",
                //   typeInputan: TextInputType.multiline,
                //   controlC: controller.pendidikanC,
                // ),
                CsDropdown(
                  hintText: "Pendidikan Terakhir",
                  items: const [
                    "SD",
                    "SMP",
                    "SMA",
                    "Perguruan Tinggi",
                  ],
                  valueC: (value) {
                    if (value != null) {
                      print(value);
                      controller.pendidikanC = value;
                    }
                  },
                ),
                const SizedBox(height: 15),
                CsDropdown(
                  hintText: "Pekerjaan",
                  items: const [
                    "PNS",
                    "POLRI/TNI",
                    "Tenaga Kesehatan",
                    "Guru/Dosen",
                    "Wiraswasta",
                    "Lain - Lain",
                  ],
                  valueC: (value) {
                    if (value != null) {
                      print(value);
                      controller.pekerjaanC = value;
                    }
                  },
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
