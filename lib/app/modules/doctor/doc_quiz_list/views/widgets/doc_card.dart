import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../theme.dart';
import '../../controllers/doc_quiz_list_controller.dart';

class DocCard extends StatefulWidget {
  DocCard({
    super.key,
    this.pertanyaanV,
    required this.idV,
  });

  String? pertanyaanV;
  String idV;

  @override
  State<DocCard> createState() => _DocCardState();
}

class _DocCardState extends State<DocCard> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DocQuizListController());
    return Container(
      height: 60,
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: containerInputColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  "${widget.pertanyaanV}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textStyleBlack.copyWith(
                    fontSize: 17,
                    fontWeight: medium,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.edit,
                  size: 30,
                  color: Colors.green,
                ),
              ),
              const SizedBox(width: 20),
              GestureDetector(
                // onTap: () => controller.delete(widget.idV),
                onTap: () async {
                  await showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Konfirmasi'),
                      content: const Text(
                          'Apakah Anda yakin ingin menghapus kuesioner?'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Get.back(),
                          child: const Text('Tidak'),
                        ),
                        TextButton(
                          onPressed: () {
                            controller.delete(widget.idV);
                            Get.back();
                          },
                          child: const Text('Ya'),
                        ),
                      ],
                    ),
                  );
                },
                child: const Icon(
                  Icons.delete,
                  size: 30,
                  color: Colors.red,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
