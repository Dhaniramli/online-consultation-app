import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../theme.dart';

class SplashscreenView extends StatelessWidget {
  const SplashscreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Container(
            color: primaryColor,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 250,
                    child: Lottie.asset("assets/lottie/consultation.json"),
                  ),
                  Image.asset(
                    'assets/picture/comingsoon.png',
                    width: 206,
                    height: 60,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
