import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../global_widgets/message.dart';
import '../../../pickers/datetimepicker.dart';

///Use `StepFunctionType.next` for `continue`.
///Use `StepFunctionType.cancel` for `cancel`.
enum StepFunctionType { next, cancel }

class CreateEventController extends GetxController {
  get key => _key;
  final origin = LatLng(0, 0);

  RxInt stepIndex = 0.obs;

  late GlobalKey<FormState> _key = GlobalKey();
  late TextEditingController eventName;
  late TextEditingController description;
  late TextEditingController categoriesText;
  late TextEditingController location;
  final Rx<LatLng> coordinates = LatLng(0, 0).obs;
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

  void setCoordinates(LatLng? value) {
    coordinates.value = value!;
    update();
    print(coordinates.toJson());
  }

  bool dateAndTimeValidator() {
    if (dates.value.length == 0 || times.value.length == 0)
      FlashMessage.errorFlash('Date or Time not picked.');
    else if (isOneDayEvent.value && dates.value.length != 1)
      FlashMessage.errorFlash('One Day Event but more than 1 dates found.');
    else if (!isOneDayEvent.value && dates.value.length != 2)
      FlashMessage.errorFlash('Multiple Day Event but only 1 date found.');
    else if (times.value.length != 2)
      FlashMessage.errorFlash('Start and end time error.');
    else
      return true;
    return false;
  }

  String? locationValidator(String? value) {
    if (value!.isEmpty) return 'Event location is empty.';
    if (!GetUtils.isLengthBetween(value, 10, 52))
      return 'Event location must be between 10 to 52 characters.';
    return null;
  }

  coordinatesValidator() {
    if (coordinates.value == origin) {
      FlashMessage.errorFlash('Location coordinates not picked.');
      return false;
    }
    return true;
  }

  bool validateForm1() {
    if (_key.currentState!.validate() && dateAndTimeValidator()) {
      return true;
    }
    return false;
  }

  bool validateForm2() {
    if (_key.currentState!.validate()) {
      return true;
    }
    return false;
  }

  void submit() {
    if (validateForm2() && coordinatesValidator()) {
      FlashMessage.successFlash('Submitted');
      print(
          "Data: {name: ${eventName.text}, description:${description.text}, categories: ${categoriesText.text}, date: ${dates.value},location: ${location.text}, coordinates: ${coordinates.value}}");
    }
  }
}
