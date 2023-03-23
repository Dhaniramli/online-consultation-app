// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../../../theme.dart';
// import '../controllers/chat_room_controller.dart';

// class Message extends StatelessWidget {
//   Map<String, dynamic>? map;

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(ChatRoomController());
//     // Widget messages(Map<String, dynamic> map) {
//     return Container(
//       alignment: map?['sendby'] == _auth.currentUser?.email
//           ? Alignment.centerRight
//           : Alignment.centerLeft,
//       width: double.infinity,
//       margin: const EdgeInsets.only(top: 20),
//       child: Column(
//         crossAxisAlignment: map?['sendby'] == _auth.currentUser?.email
//             ? CrossAxisAlignment.end
//             : CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: map?['sendby'] == _auth.currentUser?.email
//                 ? MainAxisAlignment.end
//                 : MainAxisAlignment.start,
//             children: [
//               Flexible(
//                 child: Container(
//                   constraints: BoxConstraints(
//                     maxWidth: MediaQuery.of(context).size.width * 0.6,
//                   ),
//                   padding: const EdgeInsets.all(15),
//                   decoration: BoxDecoration(
//                     color: primaryColor,
//                     borderRadius: BorderRadius.only(
//                         topLeft: const Radius.circular(8),
//                         topRight: const Radius.circular(8),
//                         bottomLeft: Radius.circular(
//                             map?['sendby'] == _auth.currentUser?.email ? 8 : 0),
//                         bottomRight: Radius.circular(
//                             map?['sendby'] == _auth.currentUser?.email ? 0 : 8)),
//                   ),
//                   child: Text(
//                     map?["message"],
//                     style: textWhiteStyle.copyWith(fontSize: 13),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           // SizedBox(height: 2),
//           // Text(
//           //   "10.00",
//           //   // map['time'],
//           //   style: textStyleBlack.copyWith(fontSize: 11),
//           // ),
//         ],
//       ),
//     );
//   }
// }
// // }