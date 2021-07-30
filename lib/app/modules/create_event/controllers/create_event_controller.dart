import 'package:eventrack_app/app/modules/initLoad/controllers/init_load_controller.dart';
import 'package:eventrack_app/app/modules/userdashboard/controllers/userdashboard_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../global_widgets/message.dart';
import '../../../models/event/event.dart';
import '../../../models/response.dart';
import '../../../pickers/datetimepicker.dart';
import '../providers/create_event_provider.dart';
import '../providers/create_event_providerImpl.dart';

///Use `StepFunctionType.next` for `continue`.
///Use `StepFunctionType.cancel` for `cancel`.
enum StepFunctionType { next, cancel }

class CreateEventController extends GetxController {
  final origin = LatLng(0, 0);

  RxInt stepIndex = 0.obs;

  late CreateEventProvider _createEventProvider;

  late TextEditingController eventName;
  late TextEditingController description;
  late TextEditingController categoriesText;
  late TextEditingController location;
  final Rx<LatLng> coordinates = LatLng(0, 0).obs;
  late List<String> selectedCategories = [];
  final dates = Rx<List<String>>([]);
  final times = Rx<List<String>>([]);
  late TextEditingController maxParticipants;
  final RxBool isOneDayEvent = true.obs;
  final RxBool hasParticipantLimit = false.obs;

  final RxBool saving = false.obs;

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

  @override
  void onInit() {
    eventName = TextEditingController();
    description = TextEditingController();
    categoriesText = TextEditingController();
    maxParticipants = TextEditingController();
    location = TextEditingController();
    _createEventProvider = Get.find<CreateEventProviderImpl>();
    super.onInit();
  }

  @override
  void onClose() {
    eventName.dispose();
    description.dispose();
    categoriesText.dispose();
    location.dispose();
    maxParticipants.dispose();
  }

  void toggleOneDayMode(bool? value) {
    isOneDayEvent.value = value!;
  }

  void toggleParticipantLimit(bool? value) =>
      hasParticipantLimit.value = value!;

  void _toggleSavingState() => saving.value = !saving.value;

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

  String? maxParticipantsValidator(String? value) {
    if (!GetUtils.isNumericOnly(value!)) return 'Please enter a valid count.';
    if (int.parse(value) <= 10) return 'Maximum participants count is too low.';
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
    String? message;
    bool state = false;
    if (dates.value.length == 0 || times.value.length == 0)
      message = 'Date or Time not picked.';
    else if (isOneDayEvent.value && dates.value.length != 1)
      message = 'One Day Event but more than 1 dates found.';
    else if (!isOneDayEvent.value && dates.value.length != 2)
      message = 'Multiple Day Event but only 1 date found.';
    else if (times.value.length != 2)
      message = 'Start and end time error.';
    else
      state = true;
    if (state == false) FlashMessage(false, message: message);
    return state;
  }

  String? locationValidator(String? value) {
    if (value!.isEmpty) return 'Event location is empty.';
    if (!GetUtils.isLengthBetween(value, 3, 52))
      return 'Event location must be between 3 to 52 characters.';
    return null;
  }

  bool coordinatesValidator() {
    if (coordinates.value == origin) {
      FlashMessage(false, message: 'Location coordinates not picked.');
      return false;
    }
    return true;
  }

  bool validateForm1() {
    if (dateAndTimeValidator()) {
      return true;
    }
    return false;
  }

  bool validateForm2() {
    if (coordinatesValidator()) {
      return true;
    }
    return false;
  }

  Future submit() async {
    _toggleSavingState();
    try {
      if (validateForm2()) {
        Map<String, dynamic> event = Event(
          title: eventName.text.trim(),
          description: description.text.trim(),
          categories: selectedCategories,
          dateTime: TimeDate(
            dates: dates.value,
            times: times.value,
          ),
          maxParticipants: int.parse(maxParticipants.text),
          location: Location(
            latitude: coordinates.value.latitude,
            longitude: coordinates.value.longitude,
            location: location.text.trim(),
          ),
        ).toJson();

        ResponseModel? response = await _createEventProvider.createEvent(event);

        FlashMessage(response!.state, message: response.message);
        if (response.state) {
          UserdashboardController _dashboard =
              Get.find<UserdashboardController>();
          InitLoadController _controller = Get.find<InitLoadController>();
          List<Event> events = _controller.events;
          events.add(response.event!);
          _controller.updateEvents(events);
          _dashboard.seeAll('all');
        }
      }
    } on Exception catch (e) {
      print(e);
    }
    _toggleSavingState();
  }
}
