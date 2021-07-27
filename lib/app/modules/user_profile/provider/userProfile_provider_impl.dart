import 'package:dio/dio.dart' as Dio;
import 'package:get/get.dart';

import '../../../models/response.dart';
import '../../../services/http_service.dart';
import '../../../services/http_service_impl.dart';
import 'userProfile_provider.dart';

class UserProfileProviderImpl implements UserProfileProvider {
  late HttpService _httpService;

  //Add this to binding so that we can use it in controller or view
  UserProfileProviderImpl() {
    _httpService = Get.put(HttpImplementation());
    _httpService.init();
  }

  @override
  Future<ResponseModel> uploadCover(Dio.FormData data) async {
    try {
      final ResponseModel response =
          await _httpService.postRequest('/user/uploadProfile', data: data);

      return response;
    } on Exception catch (e) {
      print(e);
      return ResponseModel(message: 'Error Uploading Image.', state: false);
    }
  }
}
