import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../temp_data.dart';

class ParticipantsListController extends GetxController {
  get users => TempData.users;
  late TextEditingController searchText;

  @override
  void onInit() {
    searchText = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    searchText.dispose();
  }

  void search() {
    print('Search for ${searchText.text}');
  }
}
