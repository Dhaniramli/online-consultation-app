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

      chat_id = newChatDoc.id;
    }
    print("Chat ID $chat_id");

    print("${userMap?["email"]}");
    Get.to(
      ChatRoomView(
        userMap: userMap,
        chatRoomid: "$chat_id",
        friendEmail: userMap?["email"],
      ),
    );
  }
}
