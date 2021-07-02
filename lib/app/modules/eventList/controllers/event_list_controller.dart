import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../temp_data.dart';

class EventListController extends GetxController {
  get events => TempData.events;
  final searchFormKey = GlobalKey<FormState>();
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
    if (searchFormKey.currentState!.validate())
      print('Search for ${searchText.text}');
  }
}
