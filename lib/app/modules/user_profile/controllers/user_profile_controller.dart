import 'dart:io';

import 'package:dio/dio.dart' as Dio;
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

import '../../../controllers/controllers/global_controller.dart';
import '../../../global_widgets/message.dart';
import '../../../models/response.dart';
import '../../../models/user/user.dart';
import '../../../pickers/filePicker.dart';
import '../provider/userProfile_provider.dart';
import '../provider/userProfile_provider_impl.dart';

class UserProfileController extends GetxController {
  final user = User(
      profileImage:
          "https://oesexportimport.com/wp-content/uploads/2020/07/user1.jpg",
      name: "Rose Watson",
      email: "rosewatson@example.com",
      phone: "+977 9863556656",
      address: "New York",
      gender: "Female");

  late UserProfileProvider _provider;
  late GlobalController _globalController;
  @override
  void onInit() {
    //TODO: Find not working
    _globalController = Get.put(GlobalController());
    // _globalController = Get.find<GlobalController>();
    _provider = Get.find<UserProfileProviderImpl>();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future pickProfile() async {
    PlatformFile? pickedFile = await ETFilePicker.selectAnImage();
    File file = File(pickedFile!.path!);
    Dio.FormData data = Dio.FormData.fromMap({
      'image': await Dio.MultipartFile.fromFile(file.path,
          filename: file.path.split('/').last)
    });
    // ResponseModel response = await _provider.uploadCover(data);
    // FlashMessage(response.state,
    //     message: response.message, displayOnSuccess: true);
    // print(response.message);
    // if (response.state) _globalController.updateUser(response.user!);
  }
}
