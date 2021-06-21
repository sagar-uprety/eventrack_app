import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CreateEventController extends GetxController {
  get key => _key;

  static late GlobalKey<FormState> _key = GlobalKey();
  late TextEditingController eventName;
  late TextEditingController description;
  late TextEditingController categoriesText;
  late List<String> selectedCategories = [];
  late List<String> dates = [];
  late List<TimeOfDay> time = [];

  late List<String> categoriesList = [
    'Award',
    'Competition',
    'Educational',
    'Festival',
    'Networking',
    'Science & Technology',
    'Seminar',
    'Social',
    'Sports',
    'Trade',
    'Workshop',
    'Others'
  ];

  @override
  void onInit() {
    eventName = TextEditingController();
    description = TextEditingController();
    categoriesText = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    eventName.dispose();
    description.dispose();
  }

  String? eventNameValidator(String? value) {
    if (value!.isEmpty) return 'Event Name is empty.';
    if (!GetUtils.isLengthBetween(value, 8, 32))
      return 'Event name must be between 8 to 32 characters.';

    return null;
  }

  String? descriptionValidator(String? value) {
    if (value!.isEmpty) return 'Description is empty.';
    if (!GetUtils.isLengthBetween(value, 32, 100))
      return 'Description must be between 32 to 100 characters.';
    return null;
  }

  String? categoriesValidator(String? value) {
    if (value!.isEmpty) return 'At least 1 category must be selected.';
    if (!GetUtils.isLengthLessOrEqual(selectedCategories, 3))
      return 'Upto 3 categories can only be selected.';
    return null;
  }

  void changeCategoriesList(bool value, String category) {
    if (value && !selectedCategories.contains(category)) {
      selectedCategories.add(category);
    } else {
      selectedCategories.remove(selectedCategories.indexOf(category));
    }

    categoriesText.text = selectedCategories.join(', ');
  }

  void submit() {
    if (key.currentState.validate()) print('Submitted');
  }
}
