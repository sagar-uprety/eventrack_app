import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../models/event/event.dart';
import '../../../models/response.dart';
import '../../../pickers/datetimepicker.dart';
import '../../initLoad/controllers/init_load_controller.dart';
import '../provider/event_list_provider.dart';
import '../provider/event_list_provider_impl.dart';

class EventListController extends GetxController {
  late EventListProvider _eventsProvider;
  final searchFormKey = GlobalKey<FormState>();
  late TextEditingController searchText;
  late InitLoadController _global;
  late List<Event> _events;
  final RxList<Event> filteredEvents = <Event>[].obs;

  late List<String> filterDate = [];
  late RxList<String> filterCategories = <String>[].obs;

  List<Event> get passedevents => Get.arguments;

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
  @override
  void onInit() async {
    searchText = TextEditingController();
    _eventsProvider = Get.find<EventListProviderImpl>();
    _global = Get.find<InitLoadController>();

    _events = passedevents;
    filteredEvents.value = _events;
    update();
    print(_global.currentUser.toJson());
    super.onInit();
  }

  RxBool isLoading = false.obs;

  loadEventList() async {
    showLoading();
    //call to Provider Method which in turn call to our API
    final result = await _eventsProvider.getEventList();
    //this result is already parsed and is converted to List<Events>
    if (result != null) {
      _events = result.obs;
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
    filteredEvents.value = _events;
    searchText.text = '';
    filterCategories.value = [];
    filterDate = [];
  }

  Future search() async {
    try {
      if (searchFormKey.currentState!.validate()) {
        //assign the received `response.eventList` to `filteredEvents
        final ResponseModel? result = await _eventsProvider.getSearchList(
            data: {
              "title": searchText.text,
              "category": filterCategories,
              "date": filterDate
            });
        print(result);
        if (result!.state) {
          filteredEvents.value = result.eventList!;
          hideLoading();
        } else {
          print("Data Not Found");
          hideLoading();
        }
      }
    } catch (e) {
      print(e);
    }
    print(
        'Text: ${searchText.text}\nCategories: ${filterCategories.join(", ")}\nDate: ${filterDate.join("-")}');
  }
}
