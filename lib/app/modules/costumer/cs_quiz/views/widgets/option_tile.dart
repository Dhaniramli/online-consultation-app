import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_consultation_app/theme.dart';

import '../../controllers/cs_quiz_controller.dart';

class OptionTile extends StatelessWidget {
  final String? question;
  final String? description;
  final String optionSelected;
  final String? email;
  final String? spesialis;
  final int? index;
  final bool isSelected;

  OptionTile({
    required this.question,
    this.description,
    required this.optionSelected,
    this.email,
    this.spesialis,
    this.index,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            width: 30,
            height: 30,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isSelected ? Colors.green : Colors.grey[300],
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: isSelected ? Colors.green : Colors.grey[400]!,
                width: 1.5,
              ),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              description!,
              style: TextStyle(
                color: isSelected ? Colors.green : Colors.grey[800]!,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
