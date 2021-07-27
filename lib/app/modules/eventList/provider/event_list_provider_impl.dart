import 'package:get/get.dart';

import '../../../models/event/event.dart';
import '../../../models/response.dart';
import '../../../services/http_service.dart';
import '../../../services/http_service_impl.dart';
import './event_list_provider.dart';

class EventListProviderImpl implements EventListProvider {
  late HttpService _httpService;

  //Add this to binding so that we can use it in controller or view
  EventListProviderImpl() {
    _httpService = Get.put(HttpImplementation());
    _httpService.init();
  }

  @override
  Future<List<Event>?> getEventList() async {
    try {
      final ResponseModel response = await _httpService.getRequest('/events/');

      return response.eventList;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<ResponseModel?> getSearchList({Map<String, dynamic>? data}) async {
    try {
      final ResponseModel response =
          await _httpService.getRequest('/events/search', data: data!);

      return response;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }
}
