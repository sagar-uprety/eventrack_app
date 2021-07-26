import 'package:get/get.dart';

import '../../../models/response.dart';
import '../../../services/http_service.dart';
import '../../../services/http_service_impl.dart';
import './event_detail_provider.dart';

class EventDetailProviderImpl implements EventDetailProvider {
  late HttpService _httpService;

  //Add this to binding so that we can use it in controller or view
  EventDetailProviderImpl() {
    _httpService = Get.put(HttpImplementation());
    _httpService.init();
  }

  @override
  Future<ResponseModel?> registerToEvent(String id) async {
    try {
      final ResponseModel response =
          await _httpService.postRequest('/events/$id');

      return response;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }
}
