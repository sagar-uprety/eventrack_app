import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utilities/colors.dart';

class Category extends StatelessWidget {
  Category(this.category, this.selectedCategories, {required this.onChanged});
  final String category;
  final List<String> selectedCategories;
  final void Function(bool, String) onChanged;

  final RxBool isSelected = false.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      isSelected.value = selectedCategories.contains(category);
      return Container(
        width: Get.width * 0.45,
        child: CheckboxListTile(
          title: Text(
            category,
            style: Theme.of(context).textTheme.subtitle2,
          ),
          value: isSelected.value,
          onChanged: (bool? value) {
            isSelected.value = isSelected.value ? false : true;
            onChanged(value!, category);
          },
          selectedTileColor: AppColors.dark50,
          activeColor: AppColors.dark50,
          dense: true,
          controlAffinity: ListTileControlAffinity.leading,
        ),
      );
    });
  }
}
