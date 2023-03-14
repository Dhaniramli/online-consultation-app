import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../theme.dart';
import '../../cs_chat/views/cs_chat_view.dart';
import '../../cs_home/views/cs_home_view.dart';
import '../../cs_profile/views/cs_profile_view.dart';
import '../controllers/cs_main_navigation_controller.dart';

class CsMainNavigationView extends StatefulWidget {
  // const MainNavigationView({super.key});
  // final String type;
  // const MainNavigationView({super.key, required this.type});

  @override
  State<CsMainNavigationView> createState() => _CsMainNavigationViewState();
}

class _CsMainNavigationViewState extends State<CsMainNavigationView> {
  final controller = Get.find<CsMainNavigationController>();

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
          return const CsHomeView();
        case 1:
          return const CsChatView();
        case 2:
          return const CsProfileView();
        default:
          return const CsHomeView();
      }
    }

    return Scaffold(
      backgroundColor: bgColor1,
      bottomNavigationBar: bottomNav(),
      body: body(),
    );
  }
}
