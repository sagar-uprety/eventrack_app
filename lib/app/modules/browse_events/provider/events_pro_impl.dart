import 'package:get/get.dart';

import '../../../models/event/event.dart';
import '../../../models/response.dart';
import '../../../services/http_service.dart';
import '../../../services/http_service_impl.dart';
import 'events_provider.dart';

class EventsProviderImpl implements EventsProvider {
  late HttpService _httpService;

  //Add this to binding so that we can use it in controller or view
  EventsProviderImpl() {
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
}
