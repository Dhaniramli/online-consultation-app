import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/cs_chat_controller.dart';

class CsChatView extends GetView<CsChatController> {
  const CsChatView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CsChatView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CsChatView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
