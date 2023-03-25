import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CsHomeController extends GetxController {
  late TextEditingController searchC;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  var queryAwal = [].obs;
  var tempSearch = [].obs;

  Future<void> searchDoctor(String data) async {
    print("SEARCH: ${data}");

    if (data.length == 0) {
      queryAwal.value = [];
      tempSearch.value = [];
    } else {
      var capitalized = data.substring(0, 1).toUpperCase() + data.substring(1);
      print(capitalized);

      if (queryAwal.length == 0 && data.length == 1) {
        //fungsi yang akan dijalankan pada satu huruf ketikan pertama
        CollectionReference users = await firestore.collection("users");
        final keyNameResult = await users
            .where("type", isEqualTo: "doctor")
            .where("keySpesialis",
                isEqualTo: data.substring(0, 1).toUpperCase())
            .get();

        print("TOTAL DATA : ${keyNameResult.docs.length}");
        if (keyNameResult.docs.length > 0) {
          for (int i = 0; i < keyNameResult.docs.length; i++) {
            queryAwal.add(keyNameResult.docs[i].data() as Map<String, dynamic>);
          }
          print("QUERY RESULT");
          print(queryAwal);
        } else {
          print("TIDAK ADA DATA");
        }
      }

      if (queryAwal.length != 0) {
        tempSearch.value = [];
        queryAwal.forEach((element) {
          if (element["spesialis"].startsWith(capitalized)) {
            tempSearch.add(element);
          }
        });
      }
    }

    queryAwal.refresh();
    tempSearch.refresh();
  }

  @override
  void onInit() {
    searchC = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    searchC.dispose();
    super.onClose();
  }
}
