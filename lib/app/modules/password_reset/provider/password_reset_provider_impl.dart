import 'package:eventrack_app/app/modules/password_reset/provider/password_reset_provider.dart';
import 'package:get/get.dart';

import '../../../models/response.dart';
import '../../../services/http_service.dart';
import '../../../services/http_service_impl.dart';

class PasswordResetProviderImpl implements PasswordResetProvider {
  late HttpService _httpService;

  //Add this to binding so that we can use it in controller or view
  PasswordResetProviderImpl() {
    _httpService = Get.put(HttpImplementation());
    _httpService.init();
  }

  @override
  Future<ResponseModel> changePassword(Map<String, dynamic> data) async {
    final ResponseModel response =
        await _httpService.postRequest('/auth/resetPassword', data: data);
    return response;
  }
}
