import 'dart:io';

import 'package:dio/dio.dart' as Dio;
import 'package:eventrack_app/app/modules/initLoad/controllers/init_load_controller.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import '../../../models/user/user.dart';
import '../../../pickers/filePicker.dart';
import '../provider/userProfile_provider.dart';
import '../provider/userProfile_provider_impl.dart';

class UserProfileController extends GetxController {


  late UserProfileProvider _provider;
  late InitLoadController global;
  @override
  void onInit() {
   global = Get.find<InitLoadController>();
    _provider = Get.find<UserProfileProviderImpl>();
    print(global);
    print(
        'User: ${global.currentUser.toJson()}\n\n\n Organizaiton: ${global.organization.toJson()}\n\n\n First Event: ${global.events.length}');
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
