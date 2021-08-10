import 'dart:io';

import 'package:dio/dio.dart' as Dio;
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

import '../../../global_widgets/message.dart';
import '../../../models/event/event.dart';
import '../../../models/organization/organization.dart';
import '../../../models/response.dart';
import '../../../pickers/filePicker.dart';
import '../../initLoad/controllers/init_load_controller.dart';
import '../provider/org_profile_provider.dart';
import '../provider/org_profile_provider_impl.dart';

class OrganizationProfileController extends GetxController {
  final RxBool showMore = false.obs;
  final Rx<Organization> _organization = Organization().obs;
  late OrgProfileProvider _orgProfileProvider;
  late RxList<Event> createdEventList;
  late InitLoadController _global;

  get orgData => _organization.value;

  @override
  void onInit() async {
    _orgProfileProvider = Get.find<OrgProfileProviderImpl>();
    _global = Get.find<InitLoadController>();
    _organization.value = Get.arguments;
    createdEventList = <Event>[].obs;
    await getCreatedEventsData();
    super.onInit();
  }

  getCreatedEventsData() async {
    ResponseModel? events =
        await _orgProfileProvider.getCreatedEvents(orgData.id!);
    if (events!.state) createdEventList.value = events.eventList!;
  }

  void toggleDescriptionDisplay() => showMore.value = !showMore.value;

  Future pickProfile() async {
    PlatformFile? pickedFile = await ETFilePicker.selectAnImage();
    File file = File(pickedFile!.path!);
    Dio.FormData data = Dio.FormData.fromMap({
      'image': await Dio.MultipartFile.fromFile(file.path,
          filename: file.path.split('/').last)
    });
    ResponseModel response = await _orgProfileProvider.uploadProfile(data);
    FlashMessage(response.state,
        message: response.message, displayOnSuccess: true);
    if (response.state) {
      _global.updateOrganization(response.organization!);
      _organization.value = response.organization!;
    }
  }
}
