import 'package:get/get.dart';

import '../../../models/response.dart';
import '../../../services/http_service.dart';
import '../../../services/http_service_impl.dart';
import 'create_event_provider.dart';

class CreateEventProviderImpl implements CreateEventProvider {
  late HttpService _httpService;

  //Add this to binding so that we can use it in controller or view
  CreateEventProviderImpl() {
    _httpService = Get.put(HttpImplementation());
    _httpService.init();
  }

  @override
  Future<ResponseModel?> createEvent(Map<String, dynamic>? data) async {
    try {
      final ResponseModel? response =
          await _httpService.postRequest('/events/', data: data!);
      return response;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }
}
