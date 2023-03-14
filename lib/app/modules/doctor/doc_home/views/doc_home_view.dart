import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/doc_home_controller.dart';

class DocHomeView extends GetView<DocHomeController> {
  const DocHomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DocHomeView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DocHomeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
