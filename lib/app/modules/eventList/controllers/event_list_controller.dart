import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../models/event/event.dart';
import '../../../pickers/datetimepicker.dart';
import '../provider/event_list_provider.dart';
import '../provider/event_list_provider_impl.dart';

class EventListController extends GetxController {
  late EventListProvider _eventsProvider;
  final searchFormKey = GlobalKey<FormState>();
  late TextEditingController searchText;

  late List<Event> events;
  final RxList<Event> filteredEvents = <Event>[].obs;

  late List<String> filterDate = [];
  late RxList<String> filterCategories = <String>[].obs;

  List<String> categoriesList = [
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

  EventListController() {
    events = []; // assign all events
    filteredEvents.value = events;
    searchText = TextEditingController();
    _eventsProvider = Get.find<EventListProviderImpl>();
    loadEventList();
  }

  RxBool isLoading = false.obs;

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

  Future pickFilterDate() async {
    filterDate = await DateTimePicker.dateRangePicker(Get.context!,
        selectedDateRange: filterDate);
  }

  void pickCategory(String category) {
    if (filterCategories.contains(category))
      filterCategories.remove(category);
    else
      filterCategories.add(category);
  }

  bool checkSelectedCategory(category) {
    bool isSelected = false;
    filterCategories.contains(category)
        ? isSelected = true
        : isSelected = false;
    return isSelected;
  }

  void clearFilter() {
    filteredEvents.value = events;
    searchText.text = '';
    filterCategories.value = [];
    filterDate = [];
  }

  void search() {
    if (searchFormKey.currentState!.validate()) {
      //assign the received `response.eventList` to `filteredEvents`
      print(
          'Text: ${searchText.text}\nCategories: ${filterCategories.join(", ")}\nDate: ${filterDate.join("-")}');
    }
  }
}
