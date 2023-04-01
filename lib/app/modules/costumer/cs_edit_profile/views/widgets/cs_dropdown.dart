import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../theme.dart';
import '../../controllers/cs_edit_profile_controller.dart';

class CsDropdown extends StatelessWidget {
  CsDropdown({
    super.key,
    required this.hintText,
    required this.items,
  });

  List<String> items;
  String hintText;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CsEditProfileController());
    return Container(
      height: 56,
      padding: const EdgeInsets.only(right: 10.0, left: 20.0, top: 5.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: containerInputColor),
      child: DropdownSearch<String>(
        popupProps: const PopupProps.menu(
          showSelectedItems: true,
          // disabledItemFn: (String s) => s.startsWith('I'),
        ),
        items: items,
        dropdownDecoratorProps: DropDownDecoratorProps(
          dropdownSearchDecoration: InputDecoration(
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
            hintText: hintText,
            hintStyle: textInputColorStyle.copyWith(
                fontSize: 16, fontWeight: semiBold),
          ),
        ),
        // selectedItem: "SD",
        onChanged: (value) {
          // controller.ubahSatuan(value!);
          if (value != null) {
            print(value);
            controller.pendidikanC = value;
          }
        },
      ),
    );
  }
}
