import 'package:get/get.dart';

import '../../../models/response.dart';
import '../../../services/http_service.dart';
import '../../../services/http_service_impl.dart';
import 'editprofile_provider.dart';

class EditprofileProviderImpl implements EditprofileProvider {
  late HttpService _httpService;

  //Add this to binding so that we can use it in controller or view
  EditprofileProviderImpl() {
    _httpService = Get.put(HttpImplementation());
    _httpService.init();
  }

  @override
  Future<ResponseModel?> userProfile({Map<String, dynamic>? data}) async {
    try {
      //*This is where it uses our HttpService class to make dio requests and call API (backend)
      print('pro');
      final ResponseModel? response =
          await _httpService.postRequest('/user/edit', data: data!);
      return response;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }
}
