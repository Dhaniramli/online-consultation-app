import 'package:get/get.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:online_consultation_app/app/data/app_session.dart';
import 'package:online_consultation_app/app/modules/costumer/cs_home/views/cs_home_view.dart';
import '../../../../theme.dart';
import '../../../controllers/user_controller.dart';
import '../../../routes/app_pages.dart';
import '../controllers/chat_room_controller.dart';

class ChatRoomView extends GetView<ChatRoomController> {
  final Map<String, dynamic>? userMap;
  final String chatRoomid;
  final String? friendEmail;

  const ChatRoomView({
    super.key,
    required this.chatRoomid,
    this.userMap,
    this.friendEmail,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChatRoomController());
    // final UserController userController = Get.put(UserController());
    controller.userMapC = userMap;

    PreferredSize header() {
      return PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: primaryColor,
          leading: IconButton(
              onPressed: () {
                // Get.offAllNamed(Routes.CS_MAIN_NAVIGATION);
                Get.back();
              },
              icon: Image.asset(
                'assets/picture/panah_kiri.png',
                width: 30,
                height: 30,
              )),
          title: Row(
            children: [
              ClipOval(
                child: Container(
                  color: textGreyColor,
                  child: StreamBuilder<DocumentSnapshot<Object?>>(
                    stream: controller.streamFriendData("$friendEmail"),
                    builder: ((context, snapFriend) {
                      if (snapFriend.connectionState ==
                          ConnectionState.active) {
                        var dataFriend =
                            snapFriend.data!.data() as Map<String, dynamic>;
                        if (dataFriend["photo"] == "") {
                          return Image.asset(
                            'assets/picture/dokter.png',
                            height: 50,
                            width: 50,
                            fit: BoxFit.cover,
                          );
                        } else {
                          return Image.network(
                            "${dataFriend["photo"]}",
                            height: 50,
                            width: 50,
                            fit: BoxFit.cover,
                          );
                        }
                      }
                      return Image.asset(
                        'assets/picture/dokter.png',
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      );
                    }),
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: StreamBuilder<DocumentSnapshot<Object?>>(
                  stream: controller.streamFriendData("$friendEmail"),
                  builder: ((context, snapFriend) {
                    if (snapFriend.connectionState == ConnectionState.active) {
                      var dataFriend =
                          snapFriend.data!.data() as Map<String, dynamic>;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${dataFriend["fullName"]}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: textWhiteStyle.copyWith(
                                fontWeight: medium, fontSize: 14),
                          ),
                          dataFriend["status"] == true
                              ? Text(
                                  "Online",
                                  style: textStyleOrange.copyWith(
                                      fontWeight: light, fontSize: 14),
                                )
                              : Text(
                                  "Offline",
                                  style: textStyleOrange.copyWith(
                                      fontWeight: light, fontSize: 14),
                                )
                        ],
                      );
                    }
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Loading...",
                          style: textWhiteStyle.copyWith(
                              fontWeight: medium, fontSize: 14),
                        ),
                        Text(
                          "Loading...",
                          style: textStyleOrange.copyWith(
                              fontWeight: light, fontSize: 14),
                        )
                      ],
                    );
                  }),
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  'assets/picture/camera.png',
                  width: 28.13,
                  height: 18.75,
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget chatInput() {
      return Container(
        margin: const EdgeInsets.only(right: 15.0, left: 15.0, bottom: 15.0),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 45,
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                decoration: BoxDecoration(
                    color: containerInputColor,
                    borderRadius: BorderRadius.circular(8)),
                child: Center(
                  child: TextFormField(
                    autocorrect: false,
                    controller: controller.message,
                    decoration: const InputDecoration.collapsed(
                        hintText: 'Ketik Pesan....'),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 20),
            GestureDetector(
              onTap: () {
                controller.newChat(currentUser, chatRoomid.toString(),
                    controller.message.text, userMap!["email"]);
                controller.message.clear();
              },
              child: Image.asset(
                'assets/picture/icon_send.png',
                width: 40,
                height: 40,
              ),
            )
          ],
        ),
      );
    }

    Widget content() {
      return Container(
        margin: const EdgeInsets.all(15),
        child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: controller.streamChat(chatRoomid),
          builder: (context, snapshot) {
            // print("1");
            // print(snapshot.data);
            if (snapshot.connectionState == ConnectionState.active) {
              var allData = snapshot.data?.docs.length;
              Timer(
                  Duration.zero,
                  () => controller.scrollC
                      .jumpTo(controller.scrollC.position.maxScrollExtent));
              return ListView.builder(
                controller: controller.scrollC,
                itemCount: allData,
                itemBuilder: (context, index) {
                  Map<String, dynamic> map =
                      snapshot.data?.docs[index].data() as Map<String, dynamic>;
                  if (index == 0) {
                    return Column(
                      children: [
                        Text(
                          "${map["groupTime"]}",
                          style: textStyleBlack.copyWith(
                              fontSize: 13, fontWeight: medium),
                        ),
                        messages(context, map),
                      ],
                    );
                  } else {
                    if (snapshot.data?.docs[index]["groupTime"] ==
                        snapshot.data?.docs[index - 1]["groupTime"]) {
                      return messages(context, map);
                    } else {
                      return Column(
                        children: [
                          Text(
                            "${map["groupTime"]}",
                            style: textStyleBlack.copyWith(
                                fontSize: 13, fontWeight: medium),
                          ),
                          messages(context, map),
                        ],
                      );
                    }
                  }
                },
              );
            }
            return Container();
          },
        ),
      );
    }

    return Scaffold(
      appBar: header(),
      body: Column(
        children: [
          Expanded(child: content()),
          chatInput(),
        ],
      ),
    );
  }
}

Widget messages(BuildContext context, Map<String, dynamic> map) {
  final controller = Get.put(ChatRoomController());

  return Container(
    alignment: map['pengirim'] == currentUser
        ? Alignment.centerRight
        : Alignment.centerLeft,
    width: double.infinity,
    margin: const EdgeInsets.only(top: 20),
    child: Column(
      crossAxisAlignment: map['pengirim'] == currentUser
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: map['pengirim'] == currentUser
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
          children: [
            Flexible(
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.6,
                ),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(8),
                      topRight: const Radius.circular(8),
                      bottomLeft: Radius.circular(
                          map['pengirim'] == currentUser ? 8 : 0),
                      bottomRight: Radius.circular(
                          map['pengirim'] == currentUser ? 0 : 8)),
                ),
                child: Text(
                  map["msg"],
                  style: textWhiteStyle.copyWith(fontSize: 13),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 2),
        Text(
          "${map['jm']}",
          style: textStyleBlack.copyWith(fontSize: 11),
        ),
      ],
    ),
  );
}
