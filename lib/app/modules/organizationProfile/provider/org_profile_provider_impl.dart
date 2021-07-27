import 'package:get/get.dart';

import '../../../models/response.dart';
import '../../../services/http_service.dart';
import '../../../services/http_service_impl.dart';
import './org_profile_provider.dart';

class OrgProfileProviderImpl implements OrgProfileProvider {
  late HttpService _httpService;

  //Add this to binding so that we can use it in controller or view
  OrgProfileProviderImpl() {
    _httpService = Get.put(HttpImplementation());
    _httpService.init();
  }

  @override
  Future<ResponseModel?> getCreatedEvents(String id) async {
    try {
      final ResponseModel response =
          await _httpService.getRequest('/org/getevents/$id');
      return response;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }
}
