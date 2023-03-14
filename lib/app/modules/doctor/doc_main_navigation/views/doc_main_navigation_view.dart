import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../theme.dart';
import '../../doc_chat/views/doc_chat_view.dart';
import '../../doc_home/views/doc_home_view.dart';
import '../../doc_profile/views/doc_profile_view.dart';
import '../controllers/doc_main_navigation_controller.dart';


class DocMainNavigationView extends StatefulWidget {
  // const MainNavigationView({super.key});
  // final String type;
  // const MainNavigationView({super.key, required this.type});

  @override
  State<DocMainNavigationView> createState() => _DocMainNavigationViewState();
}

class _DocMainNavigationViewState extends State<DocMainNavigationView> {
  final controller = Get.find<DocMainNavigationController>();

  @override
  Widget build(BuildContext context) {
    Widget bottomNav() {
      return BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 9,
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          backgroundColor: containerInputColor,
          currentIndex: controller.currentIndex,
          onTap: (value) {
            setState(() {
              print(value);
              controller.currentIndex = value;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.fromLTRB(0, 18, 0, 0),
                  child: Image.asset(
                      controller.currentIndex == 0
                          ? 'assets/picture/icon_home_on.png'
                          : 'assets/picture/icon_home.png',
                      width: 35,
                      color: controller.currentIndex == 0
                          ? primaryColor
                          : const Color(0xff808191)),
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.fromLTRB(0, 18, 0, 0),
                  child: Image.asset(controller.currentIndex == 1
                          ? 'assets/picture/icon_pesan_on.png'
                          : 'assets/picture/icon_pesan.png',
                      width: 40,
                      color: controller.currentIndex == 1
                          ? primaryColor
                          : const Color(0xff808191)),
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.fromLTRB(0, 18, 0, 0),
                  child: Image.asset('assets/picture/icon_profile.png',
                      width: 30,
                      color: controller.currentIndex == 2
                          ? primaryColor
                          : const Color(0xff808191)),
                ),
                label: ''),
          ],
        ),
      );
    }

    Widget body() {
      switch (controller.currentIndex) {
        case 0:
          return const DocHomeView();
        case 1:
          return const DocChatView();
        case 2:
          return const DocProfileView();
        default:
          return const DocHomeView();
      }
    }

    return Scaffold(
      backgroundColor: bgColor1,
      bottomNavigationBar: bottomNav(),
      body: body(),
    );
  }
}
