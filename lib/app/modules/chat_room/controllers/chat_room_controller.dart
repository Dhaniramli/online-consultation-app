import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ChatRoomController extends GetxController {
  final TextEditingController message = TextEditingController();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  late Map<String, dynamic>? userMapC;
  late ScrollController scrollC = ScrollController();
  String? chatRoomIdC;
  int totalUnread = 0;

  Stream<QuerySnapshot<Map<String, dynamic>>> streamChat(String chatId) {
    CollectionReference chats = firestore.collection("chats");

    return chats.doc(chatId).collection("chats").orderBy("time").snapshots();
  }

  Future<void> newChat(
      String email, String chatId, String chat, String friendEmail) async {
    if (chat != "") {
      CollectionReference chats = firestore.collection("chats");
      CollectionReference users = firestore.collection("users");
      String date = DateTime.now().toIso8601String();
      print(chatId);

      await chats.doc(chatId).collection("chats").add({
        "pengirim": email,
        "penerima": friendEmail,
        "msg": chat,
        "time": Timestamp.now(),
        "isRead": false,
      });

      Timer(Duration.zero,
          () => scrollC.jumpTo(scrollC.position.maxScrollExtent));

      await users.doc(email).collection("chats").doc(chatId).update({
        "lastTime": date,
      });

      final checkChatsFriend =
          await users.doc(friendEmail).collection("chats").doc(chatId).get();

      if (checkChatsFriend.exists) {
        // exist on friend DB
        // first cek total unread

        final checkTotalUnread = await chats
            .doc(chatId)
            .collection("chats")
            .where("isRead", isEqualTo: false)
            .where("pengirim", isEqualTo: email)
            .get();

        // total unread for friend
        totalUnread = checkTotalUnread.docs.length;

        await users.doc(friendEmail).collection("chats").doc(chatId).update({
          "lastTime": date,
          "total_unread": totalUnread,
        });
      } else {
        // not exist on friend DB
        await users.doc(friendEmail).collection("chats").doc(chatId).set({
          "connection": email,
          "chat_id": chatId,
          "total_unread": 1,
          "lastTime": date,
        });
      }
    }

    jam(String time) {
      String timestamp = time;

      // konversi string ke format DateTime
      DateTime dateTime =
          DateFormat("MMMM dd, yyyy 'at' h:mm:ss a 'UTC'Z").parse(timestamp);

      // mengambil jam dari DateTime
      return time = DateFormat("h").format(dateTime);
    }
  }
}
