import 'dart:io';

import 'package:dio/dio.dart' as Dio;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:dart_date/dart_date.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:eventrack_app/app/modules/initLoad/controllers/init_load_controller.dart';
import 'package:eventrack_app/app/pickers/filePicker.dart';

import '../../../pickers/datetimepicker.dart';
import '../../../global_widgets/message.dart';
import '../../../models/event/event.dart';
import '../../../models/response.dart';
import '../../../models/user/user.dart';
import '../provider/event_detail_provider.dart';
import '../provider/event_detail_provider_impl.dart';

class EventDetailController extends GetxController {
  final RxBool showMore = false.obs;
  late GoogleMapController? mapController;
  // late GlobalController globalController;
  late EventDetailProvider _eventDetailProvider;
  late InitLoadController global;
  late Rx<Event> _event = Event().obs;

  get event => _event.value;

  final RxBool registered = false.obs;

  // get users => TempData.users;
  late TextEditingController searchText;
  late RxList<User> partcipantList;

  List<String> get formattedDates {
    List<String> dates = [];
    event.dateTime!.dates.forEach((element) =>
        dates.add(DateTime.parse(element).format('EEEE, MMM d, ' 'yyyy')));
    return dates;
  }

  @override
  void onInit() {
    _event.value = Get.arguments;
    print(_event.value.dateTime!.toJson());
    searchText = TextEditingController();
    global = Get.find<InitLoadController>();
    _eventDetailProvider = Get.find<EventDetailProviderImpl>();
    partcipantList = <User>[].obs;
    getParticipantsData();
    super.onInit();
  }

  registerforevent() async {
    try {
      ResponseModel? register =
          await _eventDetailProvider.registerToEvent(event.id!);
      //this result is already parsed and is converted to List<Events>
      if (register!.state) {
        print("User registered");
        FlashMessage(register.state,
            message: register.message, displayOnSuccess: true);
        registered.value = true;
      } else {
        print("Data Not Found");
      }
    } catch (e) {
      print(e);
    }
  }

  getParticipantsData() async {
    try {
      ResponseModel? participants =
          await _eventDetailProvider.getParticipants(event.id!);
      //this result is already parsed and is converted to List<Events>
      if (participants!.state) {
        print("Users data found");
        partcipantList.value = participants.userList!;
      } else {
        print("Users Data Not Found");
      }
    } catch (e) {
      print(e);
    }
  }

  addtoFavorites(String id) async {
    try {
      ResponseModel added =
          await _eventDetailProvider.addtoFavourites(event.id!);
      print(added.toJson());
      if (added.state) {
        print("Added to Favourites");
        FlashMessage(added.state,
            message: added.message, displayOnSuccess: true);
      } else {
        print("Users Data Not Found");
      }
    } catch (e) {
      print(e);
    }
  }

  void search() {
    print('Search for ${searchText.text}');
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
        message: response.message, displayOnSuccess: false);
    print(response.message);
    if (response.state) {
      global.updateEvents(response.eventList!);
      _event.value = response.event!;
    }
  }
}
