import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Text("Terjadi Kesalahan"),
      ),
    );
  }
}
