import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../models/event/event.dart';
import '../../../temp_data.dart';

class EventDetailController extends GetxController {
  final RxBool showMore = false.obs;
  late GoogleMapController? mapController;

  Event get event => TempData.event;

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

  void toggleDescriptionDisplay() => showMore.value = !showMore.value;

  void createMap(GoogleMapController newMapController) {
    mapController = newMapController;
    update();
  }
}
