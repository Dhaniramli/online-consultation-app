import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../../../data/app_session.dart';
import '../../../chat_room/views/chat_room_view.dart';

class CsDetailDoctorController extends GetxController {
  bool flagNewConnection = false;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late String namaDokterC;
  // late String emailC;
  Map<String, dynamic>? userMap;
  late String roomId;

  var chat_id;

  selectUser() async {
    String date = DateTime.now().toIso8601String();
    CollectionReference chats = _firestore.collection("chats");
    CollectionReference users = _firestore.collection("users");

    final doChats = await users.doc(currentUser).collection("chats").get();

    if (doChats.docs.length != 0) {
      final checkConnection = await users
          .doc(currentUser)
          .collection("chats")
          .where("connection", isEqualTo: userMap?["email"])
          .get();

      if (checkConnection.docs.length != 0) {
        flagNewConnection = false;

        //chat_id from chats collection
        checkConnection.docs[0].id;
      } else {
        flagNewConnection = true;
        // belum pernah chat dengan dokter
      }
    } else {
      flagNewConnection = true;
    }

    if (flagNewConnection) {
      final newChatDoc = await chats.add(
        {
          "connections": [
            _auth.currentUser!.email,
            userMap?["email"],
          ],
          "lastTime": date,
        },
      );

      // ignore: await_only_futures
      await chats.doc(newChatDoc.id).collection("chats");

      await users
          .doc(_auth.currentUser!.email)
          .collection("chats")
          .doc(newChatDoc.id)
          .set({
        "connection": userMap?["email"],
        "chat_id": newChatDoc,
        "total_unread": 0,
        "lastTime": date,
      });

      // final listChats =
      //     await users.doc(_auth.currentUser!.email).collection("chats").get();
      chat_id = newChatDoc.id;
    }
    // await selectUser();
    print("Chat ID $chat_id");

    print("${userMap?["email"]}");
    Get.to(
      ChatRoomView(
        userMap: userMap,
        chatRoomid: "$chat_id",
        friendEmail: userMap?["email"],
      ),
    );
    // Get.to(ChatRoomView(userMap: userMap, chatRoomid: chat_id));
  }

  // TODO : FIXING CO

  // final docUser = await users.doc(currentUser).get();
  // final doChats =
  //     (docUser.data() as Map<String, dynamic>?)?['chats'] as List?;

  //sudah pernah chat dengan dokter
  // if (doChats != null) {
  //   // var chat_id;
  //   doChats.forEach((singleChat) {
  //     if (singleChat["connection"] == userMap?["email"]) {
  //       chat_id = singleChat['chat_id'];
  //     }
  //   });

  //   if (chat_id != null) {
  //     // sudah pernah buat koneksi dengan dokter
  //     flagNewConnection = false;
  //     Get.to(ChatRoomView(userMap: userMap));
  //     // Get.to(ChatRoomView(userMap: userMap, chatRoomid: chat_id));
  //   } else {
  //     flagNewConnection = true;
  //     // belum pernah buat koneksi dengan dokter
  //   }
  // } else {
  //   flagNewConnection = true;
  //   // belum pernah chat dengan dokter
  // }

  // if (flagNewConnection) {
  //   final newChatDoc = await chats.add({
  //     "connections": [
  //       _auth.currentUser!.email,
  //       userMap?["email"],
  //     ],
  //     "chats": [],
  //     "lastTime": date,
  //   });

  // final chat_id = newChatDoc.id;

  // doChats?.add({
  //   "connection": userMap?["email"],
  //   "chat_id": newChatDoc,
  //   "lastTime": date,
  // });

  // await users.doc(_auth.currentUser!.email).update({
  //   "chats": [
  //     {
  //       "connection": userMap?["email"],
  //       "chat_id": newChatDoc,
  //       "lastTime": date,
  //     }
  //   ]
  // });

  //     await users.doc(_auth.currentUser!.email).update({
  //       "chats": FieldValue.arrayUnion([
  //         {
  //           "connection": userMap?["email"],
  //           "chat_id": newChatDoc,
  //           "total_unread": 0,
  //           "lastTime": date,
  //         }
  //       ])
  //     });
  //     print("doChats ${doChats}");

  //     // Get.to(ChatRoomView(userMap: userMap));
  //     // chat_id = newChatDoc;
  //   }
  //   print("${userMap?["email"]}");
  //   Get.to(ChatRoomView(userMap: userMap));
  //   // Get.to(ChatRoomView(userMap: userMap, chatRoomid: chat_id));
  // }
}
