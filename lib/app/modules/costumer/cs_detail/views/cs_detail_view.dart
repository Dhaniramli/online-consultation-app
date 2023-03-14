import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/cs_detail_controller.dart';

class CsDetailView extends GetView<CsDetailController> {
  const CsDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CsDetailView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CsDetailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
