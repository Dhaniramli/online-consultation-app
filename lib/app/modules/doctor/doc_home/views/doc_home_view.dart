import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../theme.dart';
import '../controllers/doc_home_controller.dart';

class DocHomeView extends GetView<DocHomeController> {
  const DocHomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: Text("Dashboard"),
        ),
        body: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                children: [],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
