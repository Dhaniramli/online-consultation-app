import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/app_session.dart';

class UserController extends GetxController with WidgetsBindingObserver {
  bool isOnline = false;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
    updateUserStatus(true);
    isOnline = true;
  }

  @override
  void onClose() {
    updateUserStatus(false);
    isOnline = false;

    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      updateUserStatus(true);
      isOnline = true;
    } else {
      updateUserStatus(false);
      isOnline = false;
    }
  }

  void updateUserStatus(bool isOnline) {
    // final userRef = FirebaseFirestore.instance.collection('users').doc(<user_id>);
    final userRef = firestore.collection("users").doc(currentUser);
    userRef.update({
      'status': isOnline,
    });
  }
}
