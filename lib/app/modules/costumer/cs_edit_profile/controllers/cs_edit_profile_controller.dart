import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../data/app_session.dart';

class CsEditProfileController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late String emailC;
  late String pendidikanC;
  late String pekerjaanC;

  late TextEditingController fullNameC;
  late TextEditingController dateC;
  late TextEditingController kotaC;
  late TextEditingController noTelponC;
  late ImagePicker pickerC;

  XFile? pickedImage = null;

  FirebaseStorage storage = FirebaseStorage.instance;

  @override
  void onInit() {
    super.onInit();
    emailC = Get.parameters['emailV'] ?? '';
    fullNameC = TextEditingController();
    dateC = TextEditingController();
    kotaC = TextEditingController();
    noTelponC = TextEditingController();
    pickerC = ImagePicker();
  }

  @override
  void onClose() {
    fullNameC.dispose();
    dateC.dispose();
    kotaC.dispose();
    noTelponC.dispose();
    super.onClose();
  }

  updatePhotoUrl(String url) async {
    CollectionReference users = _firestore.collection("users");

    await users.doc(currentUser).update({
      "photo": url,
    });
    Get.snackbar("Berhasil", "Unggah gambar berhasil");
  }

  Future<String?> uploadImage(String uid) async {
    Reference storageRef = storage.ref("$uid.png");
    File file = File(pickedImage!.path);

    try {
      final dataUpload = await storageRef.putFile(file);

      print(dataUpload);
      final photoUrl = await storageRef.getDownloadURL();
      deleteImage();
      return photoUrl;
    } catch (err) {
      print(err);
      return null;
    }
  }

  deleteImage() {
    pickedImage = null;
    update();
  }

  Future<void> selectImage() async {
    try {
      final dataImage = await pickerC.pickImage(source: ImageSource.gallery);
      if (dataImage != null) {
        print(dataImage.name);
        pickedImage = dataImage;
      }
      update();
    } catch (err) {
      print(err);
      pickedImage = null;
      update();
    }
  }

  int valueC = 0;
  late String jenderC;
  void setGender(int? value) {
    print("Jender ${value}");
    if (value == 1) {
      jenderC = 'Laki - Laki';
    } else if (value == 2) {
      jenderC = 'Perempuan';
    } else {
      jenderC = 'Laki - Laki';
    }
  }

  onUpdate() async {
    if (fullNameC.text.isNotEmpty &&
        dateC.text.isNotEmpty &&
        kotaC.text.isNotEmpty &&
        jenderC.isNotEmpty &&
        noTelponC.text.isNotEmpty &&
        pendidikanC.isNotEmpty &&
        pekerjaanC.isNotEmpty) {
      try {
        await _firestore.collection("users").doc(emailC).update({
          "fullName": fullNameC.text,
          "dateOfBirth": dateC.text,
          "kota": kotaC.text,
          "jender": jenderC,
          "noTelpon": noTelponC.text,
          "pendidikanTerakhir": pendidikanC,
          "pekerjaan": pekerjaanC,
        });
        Get.back();
      } catch (err) {
        Get.snackbar("Terjadi kesalahan", "Tidak dapat mengedit profil");
      }
    } else {
      Get.snackbar(
        "Terjadi kesalahan",
        "Pastikan semua sudah terisi",
      );
    }
  }
}
