import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:online_consultation_app/app/data/app_session.dart';
import '../../../../theme.dart';
import '../../chat_room/views/chat_room_view.dart';
import '../controllers/select_chat_controller.dart';

class SelectChatView extends StatefulWidget {
  final String? namaDokter;
  final String? spesialis;
  final String? chatId;
  final String? friendEmail;
  final String? photo;
  final int? totalUnread;
  final String? type;
  final bool? status;
  // final double? harga;

  const SelectChatView(
      {super.key,
      this.namaDokter,
      this.spesialis,
      this.chatId,
      this.friendEmail,
      this.totalUnread,
      this.photo,
      this.type,
      this.status
      // this.harga,
      });

  @override
  State<SelectChatView> createState() => _SelectChatViewState();
}

class _SelectChatViewState extends State<SelectChatView> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SelectChatController());
    controller.chatId = widget.chatId;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    Map<String, dynamic>? userMap;

    return GestureDetector(
      onTap: () async {
        await firestore
            .collection('users')
            .where("fullName", isEqualTo: widget.namaDokter)
            .get()
            .then((value) {
          setState(() {
            userMap = value.docs[0].data();
          });
          print(userMap);
        });
        // print("${widget.chatId}");
        // print("${widget.friendEmail}");
        controller.selectChat("${widget.chatId}", currentUser, userMap ?? {},
            "${widget.friendEmail}");
      },
      child: Container(
        margin: const EdgeInsets.only(top: 15),
        padding: const EdgeInsets.all(11),
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: containerInputColor),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: widget.photo != ""
                  ? Image.network(
                      "${widget.photo}",
                      width: 80.0,
                      height: 80.0,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      'assets/picture/dokter.png',
                      width: 80.0,
                      height: 80.0,
                    ),
            ),
            const SizedBox(width: 14),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Text(
                  "${widget.namaDokter}",
                  style: textStyleBlack.copyWith(
                      fontSize: 16, fontWeight: semiBold),
                ),
                widget.type == "doctor"
                    ? Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          "Spesialis ${widget.spesialis}",
                          style: textStyleBlack.copyWith(
                              fontSize: 11, fontWeight: medium),
                        ),
                      )
                    : const SizedBox(height: 0),
                const SizedBox(height: 10),
                widget.status == true
                    ? Text(
                        'Online',
                        style: textStylePrimaryColor.copyWith(
                            fontSize: 11, fontWeight: medium),
                      )
                    : Text(
                        'Offline',
                        style: textStylePrimaryColor.copyWith(
                            fontSize: 11, fontWeight: medium),
                      ),
                // Text(
                //   '3 Februari 2023',
                //   style:
                //       textStyleGrey.copyWith(fontSize: 11, fontWeight: medium),
                // )
              ],
            ),
            const Spacer(),
            Center(
              child: widget.totalUnread != null && widget.totalUnread != 0
                  ? Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          "${widget.totalUnread}",
                          style: textWhiteStyle.copyWith(
                              fontSize: 15, fontWeight: medium),
                        ),
                      ),
                    )
                  : Container(),
            ),
          ],
        ),
      ),
    );
  }
}
