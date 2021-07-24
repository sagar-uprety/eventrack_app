import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../temp_data.dart';
import '../provider/event_list_provider.dart';
import '../provider/event_list_provider_impl.dart';
import '../../../models/event/event.dart';

class EventListController extends GetxController {
  late EventListProvider _eventsProvider;
  final searchFormKey = GlobalKey<FormState>();
  late TextEditingController searchText;

  EventListController() {
    searchText = TextEditingController();
    _eventsProvider = Get.find<EventListProviderImpl>();
    loadEventList();
  }

  RxBool isLoading = false.obs;
  RxList<Event>? events;

  loadEventList() async {
    showLoading();
    //call to Provider Method which in turn call to our API
    final result = await _eventsProvider.getEventList();
    //this result is already parsed and is converted to List<Events>
    if (result != null) {
      events = result.obs;
      hideLoading();
    } else {
      print("Data Not Found");
      hideLoading();
    }
  }

  showLoading() => isLoading.toggle();
  hideLoading() => isLoading.toggle();

  // get events => TempData.events;

  void search() {
    if (searchFormKey.currentState!.validate())
      print('Search for ${searchText.text}');
  }
}
