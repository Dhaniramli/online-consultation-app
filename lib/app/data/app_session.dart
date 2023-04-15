import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AppSession {}

get currentUser {
  return FirebaseAuth.instance.currentUser!.email;
}

get currentUserId {
  return FirebaseAuth.instance.currentUser!.uid;
}

// Stream<DocumentSnapshot<Map<String, dynamic>>> get spesialis {
//   var data = FirebaseFirestore.instance
//       .collection("users")
//       .doc(currentUser)
//       .get();

//       return FirebaseFirestore.instance.collection("quiz")
//                     .doc(data["spesialis"])
//                     .collection("quizs")
//                     .snapshots();
// }
// Stream<DocumentSnapshot<Map<String, dynamic>>> get spesialis async {
//   try {
//     // ambil dokumen user terlebih dahulu
//     var userDoc = await FirebaseFirestore.instance
//         .collection("users")
//         .doc(currentUser)
//         .get();

//     // ambil dokumen quiz sesuai dengan spesialis user
//     var quizDoc = await FirebaseFirestore.instance
//         .collection("quiz")
//         .doc(userDoc.get("spesialis"))
//         .collection("quizs")
//         .doc()
//         .snapshots();

//     // kembalikan dokumen quiz sebagai stream
//     return quizDoc;
//   } catch (e) {
//     // tangani jika terjadi error
//     print("Error while getting quiz: $e");
//   }
// }

get userDoctor {
  return FirebaseFirestore.instance
      .collection("users")
      .where("type", isEqualTo: "doctor");
}

// String currentUser = FirebaseAuth.instance.currentUser.email;

DocumentReference get userCollection {
  return FirebaseFirestore.instance.collection("users").doc(currentUser);
}

Future<QuerySnapshot<Map<String, dynamic>>> get chatCollection {
  return FirebaseFirestore.instance
      .collection('chatroom')
      .doc('documentId') // ganti dengan id dokumen yang valid
      .collection('chats')
      .where("sendto", isEqualTo: currentUser)
      .get();
}
