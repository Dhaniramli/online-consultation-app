import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/doc_chat_controller.dart';

class DocChatView extends GetView<DocChatController> {
  const DocChatView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DocChatView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DocChatView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
