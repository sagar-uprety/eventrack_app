import 'package:eventrack_app/app/pickers/datetimepicker.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

///Use `StepFunctionType.next` for `continue`.
///Use `StepFunctionType.cancel` for `cancel`.
enum StepFunctionType { next, cancel }

class CreateEventController extends GetxController {
  get key => _key;

  RxInt stepIndex = 1.obs;

  late GlobalKey<FormState> _key = GlobalKey();
  late TextEditingController eventName;
  late TextEditingController description;
  late TextEditingController categoriesText;
  late TextEditingController location;
  // late LatLng coordinates;
  late List<String> selectedCategories = [];
  final dates = Rx<List<String>>([]);
  final times = Rx<List<TimeOfDay>>([]);
  final RxBool isOneDayEvent = true.obs;

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

  get formattedDate => dates.value.length != 0 ? dates.value.formatDate : [];
  get formattedTime => times.value.length == 2 ? times.value.formatTime : [];

  @override
  void onInit() {
    eventName = TextEditingController();
    description = TextEditingController();
    categoriesText = TextEditingController();
    location = TextEditingController();
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

  void toggleOneDayMode(bool? value) {
    isOneDayEvent.value = value!;
  }

  void stepChange(int index) {
    stepIndex.value = index;
  }

  void stepFunction(StepFunctionType type) {
    switch (type) {
      case StepFunctionType.cancel:
        stepIndex.value > 0
            ? stepChange(stepIndex.value - 1)
            : print('Go Back.');
        break;
      case StepFunctionType.next:
        !(stepIndex.value >= 2)
            ? stepChange(stepIndex.value + 1)
            : print('submit form');
        break;
      default:
    }
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
      selectedCategories.remove(category);
    }
    categoriesText.text = selectedCategories.join(', ');
  }

  void pickDate(BuildContext context) async {
    dates.value = isOneDayEvent.value
        ? await DateTimePicker.datePicker(context)
        : await DateTimePicker.dateRangePicker(context);
  }

  void pickTime(BuildContext context) async {
    times.value = await DateTimePicker.timePicker(context);
  }

  bool validateForm1() {
    if (key.currentState.validate()) {
      assert((isOneDayEvent.value && dates.value.length == 1) ||
          (!isOneDayEvent.value && dates.value.length == 2));
      assert(times.value.length == 2);

      print(
          "Data: {name: ${eventName.text}, description:${description.text}, categories: ${categoriesText.text}, date: ${dates.value},}");
      return true;
    }
    return false;
  }

  void submit() {
    print('Submit');
  }
}
