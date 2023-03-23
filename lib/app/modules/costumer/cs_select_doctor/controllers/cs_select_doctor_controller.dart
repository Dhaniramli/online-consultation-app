// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get/get.dart';

// import '../../cs_detail_doctor/views/cs_detail_doctor_view.dart';

// class CsSelectDoctorController extends GetxController {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   late String namaDokterC;
//   // Map<String, dynamic>? userMap;
//   Rx<Map<String, dynamic>> userMap =
//       Rx<Map<String, dynamic>>(Map<String, dynamic>());

//   selectDoctor() async {
//     // await _firestore
//     //     .collection('users')
//     //     .where("fullName", isEqualTo: namaDokterC)
//     //     .get()
//     //     .then((value) {
//     //   setState(() {
//     //         userMap = value.docs[0].data();
//     //       });

//     //   print(userMap);
//     // });
//     // print("${userMap?["email"]}");
//     // Get.to(CsDetailDoctorView(userMap: userMap, emailDetail: userMap?["email"],));

//     // try {
//     //   final snapshot = await _firestore
//     //       .collection('users')
//     //       .where("fullName", isEqualTo: namaDokterC)
//     //       .get();

//     //   if (snapshot.docs.isNotEmpty) {
//     //     userMap = snapshot.docs[0].data();
//     //     print(userMap);
//     //     Get.to(CsDetailDoctorView(
//     //         userMap: userMap, emailDetail: userMap?["email"]));
//     //   } else {
//     //     print("No data found.");
//     //   }
//     // } catch (e) {
//     //   print("Error while fetching data: $e");
//     // }

//     final snapshot = await _firestore
//         .collection('users')
//         .where("fullName", isEqualTo: namaDokterC)
//         .get();
//         print("Nama $namaDokterC");

//     if (snapshot.docs.isNotEmpty) {
//       userMap.value = snapshot.docs[0].data();
//       print(userMap.value);
//       Get.to(CsDetailDoctorView(
//         userMap: userMap.value,
//         emailDetail: userMap.value["email"],
//       ));
//     } else {
//       print("No data found.");
//     }
//   }
// }
