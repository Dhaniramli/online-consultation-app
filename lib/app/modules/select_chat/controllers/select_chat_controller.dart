import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:online_consultation_app/app/data/app_session.dart';

import '../../chat_room/views/chat_room_view.dart';

class SelectChatController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String? chatId;

  selectChat(String chatId, String email, Map<String, dynamic>? userMap,
      String friendEmail) async {
    CollectionReference chats = firestore.collection("chats");
    CollectionReference users = firestore.collection("users");

    Get.to(() => ChatRoomView(
          userMap: userMap,
          chatRoomid: chatId,
          friendEmail: friendEmail,
        ));

    final updateStatusChat = await chats
        .doc(chatId)
        .collection("chats")
        .where("isRead", isEqualTo: false)
        .where("penerima", isEqualTo: currentUser)
        .get();

    updateStatusChat.docs.forEach((element) async {
      await chats
          .doc(chatId)
          .collection("chats")
          .doc(element.id)
          .update({"isRead": true});
    });

    await users.doc(currentUser).collection("chats").doc(chatId).update({
      "total_unread": 0,
    });
  }
}
