import 'package:get/get.dart';

import '../../../models/response.dart';
import '../../../services/http_service.dart';
import '../../../services/http_service_impl.dart';
import 'home_provider.dart';

class HomeProviderImpl implements HomeProvider {
  late HttpService _httpService;

  //Add this to binding so that we can use it in controller or view
  HomeProviderImpl() {
    _httpService = Get.put(HttpImplementation());
    _httpService.init();
  }

  @override
  Future<ResponseModel?> getCurrentUser() async {
    try {
      final ResponseModel response = await _httpService.getRequest('/user/');

      return response;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }
}
