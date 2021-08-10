import 'dart:io';

import 'package:dio/dio.dart' as Dio;
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

import '../../../global_widgets/message.dart';
import '../../../models/response.dart';
import '../../../models/user/user.dart';
import '../../../pickers/filePicker.dart';
import '../../initLoad/controllers/init_load_controller.dart';
import '../provider/userProfile_provider.dart';
import '../provider/userProfile_provider_impl.dart';

class UserProfileController extends GetxController {
  late UserProfileProvider _provider;
  late InitLoadController global;
  late Rx<User> _currentUser = User().obs;

  get currentUser => _currentUser.value;

  @override
  void onInit() {
    global = Get.find<InitLoadController>();
    _currentUser = global.currentUser.obs;
    _provider = Get.find<UserProfileProviderImpl>();
    super.onInit();
  }

  Future pickProfile() async {
    PlatformFile? pickedFile = await ETFilePicker.selectAnImage();
    File file = File(pickedFile!.path!);
    Dio.FormData data = Dio.FormData.fromMap({
      'image': await Dio.MultipartFile.fromFile(file.path,
          filename: file.path.split('/').last)
    });
    ResponseModel response = await _provider.uploadCover(data);
    FlashMessage(response.state,
        message: response.message, displayOnSuccess: false);
    print(response.message);
    if (response.state) {
      global.updateUser(response.user!);
      _currentUser.value = response.user!;
    }
  }
}
