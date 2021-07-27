import 'package:get/get.dart';

import '../../../models/response.dart';
import '../../../services/http_service.dart';
import '../../../services/http_service_impl.dart';
import 'user_provider.dart';

class UserProviderImpl implements UserDashboardProvider {
  late HttpService _httpService;

  //Add this to binding so that we can use it in controller or view
  UserProviderImpl() {
    _httpService = Get.put(HttpImplementation());
    _httpService.init();
  }

  @override
  Future<ResponseModel?> getMyFavouriteEvents() async {
    try {
      final ResponseModel response = await _httpService.getRequest('/user/myfavourites');
      print(response.toJson());
      return response;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<ResponseModel?> getMyEvents() async {
    try {
      final ResponseModel response = await _httpService.getRequest('/user/myEvents');
      print(response.toJson());
      return response;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }
}
