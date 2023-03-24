import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:online_consultation_app/app/data/app_session.dart';
import 'package:online_consultation_app/app/modules/select_chat/views/select_chat_view.dart';
import 'package:online_consultation_app/utils/loading_view.dart';

import '../../../../../theme.dart';
import '../controllers/cs_chat_controller.dart';

class CsChatView extends GetView<CsChatController> {
  const CsChatView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CsChatController());

    Widget chatList() {
      return Expanded(
        child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: controller.chatStream(currentUser),
          builder: (context, snapshot1) {
            if (snapshot1.connectionState == ConnectionState.active) {
              var listDocsChats = snapshot1.data!.docs;
              return ListView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                itemCount: listDocsChats.length,
                itemBuilder: (context, index) {
                  return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                    stream: controller
                        .friendStream(listDocsChats[index]["connection"]),
                    builder: (context, snapshot2) {
                      if (snapshot2.connectionState == ConnectionState.active) {
                        var data = snapshot2.data!.data();
                        return Container(
                          width: double.infinity,
                          color: bgColor1,
                          child: SelectChatView(
                            namaDokter: "${data?["fullName"]}",
                            spesialis: "${data?["email"]}",
                            chatId: "${listDocsChats[index].id}",
                            friendEmail: listDocsChats[index]["connection"],
                            totalUnread:
                                listDocsChats[index]["total_unread"] as int,
                          ),
                        );
                      }
                      return Container();
                    },
                  );
                },
              );
            }
            return Container();
          },
        ),
      );
    }

    Widget chatTitle() {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        child: Text(
          'Chats',
          style: textWhiteStyle.copyWith(fontSize: 30, fontWeight: semiBold),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: AppBar(
            backgroundColor: primaryColor,
            title: chatTitle(),
          ),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [chatList()],
          ),
        ),
      ),
    );
  }
}