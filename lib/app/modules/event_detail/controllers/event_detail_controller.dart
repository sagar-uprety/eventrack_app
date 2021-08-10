import 'dart:io';

import 'package:dart_date/dart_date.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../global_widgets/message.dart';
import '../../../models/event/event.dart';
import '../../../models/response.dart';
import '../../../models/user/user.dart';
import '../../../pickers/filePicker.dart';
import '../../initLoad/controllers/init_load_controller.dart';
import '../../userdashboard/controllers/userdashboard_controller.dart';
import '../provider/event_detail_provider.dart';
import '../provider/event_detail_provider_impl.dart';

class EventDetailController extends GetxController {
  final RxBool registered = false.obs;
  final RxBool registering = false.obs;
  final RxBool showMore = false.obs;
  final RxBool addedToFavourites = false.obs;
  late GoogleMapController? mapController;
  late InitLoadController globalController = Get.find<InitLoadController>();
  late EventDetailProvider _eventDetailProvider;
  late UserdashboardController _dashboard;
  late Rx<Event> _event = Event().obs;
  late User _currentUser;

  RxBool _myEvent = true.obs;
  get event => _event.value;
  get myEvent => _myEvent.value;

  late RxList<User> partcipantList;

  List<String> get formattedDates {
    List<String> dates = [];
    event.dateTime!.dates.forEach((element) =>
        dates.add(DateTime.parse(element).format('EEEE, MMM d, ' 'yyyy')));
    return dates;
  }

  @override
  void onInit() async {
    _event.value = Get.arguments;
    _currentUser = globalController.currentUser;
    _eventDetailProvider = Get.find<EventDetailProviderImpl>();
    _dashboard = Get.find<UserdashboardController>();
    _myEvent.value = (globalController.organization.id == _event.value.author);
    registerValue();
    favouritesValue();
    partcipantList = <User>[].obs;
    await getParticipantsData();
    super.onInit();
  }

  registerValue() {
    registered.value = _currentUser.registeredEvents!.contains(event.id);
    update();
  }

  favouritesValue() {
    addedToFavourites.value = _currentUser.favourites!.contains(event.id);
    update();
  }

  changeMyEvents() {
    bool state = _dashboard.myEvents.any((element) => event.id == element.id);
    _dashboard.updateMyEvents(state, event);
  }

  changeMyFavourites() {
    bool state = _dashboard.favourites.any((element) => event.id == element.id);
    _dashboard.updateMyFavourite(state, event);
  }

  registerforevent() async {
    registering.value = true;
    ResponseModel? register =
        await _eventDetailProvider.registerToEvent(event.id!);
    FlashMessage(register!.state,
        message: register.message, displayOnSuccess: true);
    if (register.state) {
      registered.value = !registered.value;
      _currentUser = register.user!;
      globalController.updateUser(_currentUser);
      changeMyEvents();
    }

    registering.value = false;
    update();
  }

  getParticipantsData() async {
    ResponseModel? participants =
        await _eventDetailProvider.getParticipants(event.id!);
    if (participants!.state) partcipantList.value = participants.userList!;
  }

  addtoFavorites() {
    // ResponseModel added = await _eventDetailProvider.addtoFavourites(event.id!);
    String? message;
    if (!addedToFavourites.value)
      message = 'This event has been added to your favourites.';
    else
      message = 'This event has been removed from your favourites.';

    FlashMessage(!addedToFavourites.value,
        message: message, displayOnSuccess: true);
    addedToFavourites.value = !addedToFavourites.value;
    changeMyFavourites();
  }

  void toggleDescriptionDisplay() => showMore.value = !showMore.value;

  void createMap(GoogleMapController newMapController) {
    mapController = newMapController;
    update();
  }

  Future pickProfile() async {
    PlatformFile? pickedFile = await ETFilePicker.selectAnImage();
    File file = File(pickedFile!.path!);
    Dio.FormData data = Dio.FormData.fromMap({
      'image': await Dio.MultipartFile.fromFile(file.path,
          filename: file.path.split('/').last)
    });
    ResponseModel response =
        await _eventDetailProvider.uploadProfile(event.id, data);
    FlashMessage(response.state,
        message: response.message, displayOnSuccess: true);
    if (response.state) {
      globalController.updateEvents(response.eventList!);
      _event.value = response.event!;
    }
  }
}
