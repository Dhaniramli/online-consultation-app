import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CsHomeController extends GetxController {
  late TextEditingController searchC;

  var queryAwal = [].obs;
  var tempSearch = [].obs;

  void searchDoctor(String data) {
    print("SEARCH: ${data}");

    if (data.length == 0) {
      queryAwal.value = [];
      tempSearch.value = [];
    } else {
      
    }
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
