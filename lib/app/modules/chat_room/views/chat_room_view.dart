import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_consultation_app/app/data/app_session.dart';
import '../../../../theme.dart';
import '../../costumer/cs_detail_doctor/controllers/cs_detail_doctor_controller.dart';
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
    // final authC = Get.find<CsDetailDoctorController>();
    final controller = Get.put(ChatRoomController());
    // controller.chatRoomIdC = chatRoomid;
    controller.userMapC = userMap;

    PreferredSize header() {
      return PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            backgroundColor: primaryColor,
            leading: IconButton(
                onPressed: () {
                  // Navigator.pop(context);
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
                    child: Image.asset(
                      'assets/picture/dokter.png',
                      height: 50,
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      // "noname",
                      userMap?['fullName'],
                      style: textWhiteStyle.copyWith(
                          fontWeight: medium, fontSize: 14),
                    ),
                    Text(
                      // 'Online',
                      userMap?['status'],
                      style: textStyleOrange.copyWith(
                          fontWeight: light, fontSize: 14),
                    ),
                  ],
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
          ));
    }

    Widget chatInput() {
      return Container(
        margin: const EdgeInsets.all(20),
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
            print("1");
            print(snapshot.data);
            if (snapshot.connectionState == ConnectionState.active) {
              var allData = snapshot.data?.docs.length;
              return ListView.builder(
                  itemCount: allData,
                  itemBuilder: (context, index) {
                    Map<String, dynamic> map = snapshot.data?.docs[index].data()
                        as Map<String, dynamic>;
                    return messages(context, map);
                  });
            }
            return Container();
          },
        ),
      );
    }

    return Scaffold(
      appBar: header(),
      body: content(),
      bottomNavigationBar: chatInput(),
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
        SizedBox(height: 2),
        Text(
          // "10.00",
          "${controller.jam("${map["time"]}")}",
          style: textStyleBlack.copyWith(fontSize: 11),
        ),
      ],
    ),
  );
}
