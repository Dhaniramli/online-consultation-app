import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/doc_detail_controller.dart';

class DocDetailView extends GetView<DocDetailController> {
  const DocDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DocDetailView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DocDetailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
