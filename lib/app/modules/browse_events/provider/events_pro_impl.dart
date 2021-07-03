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
      //*This is where it uses our HttpService class to make dio requests and call API (backend)
      // final response = await _httpService.getRequest('/events');

      //*Now converting JSON Response to Dart Object. See Models to see how it's done
      // final parsedResponse = EventList.fromJson(response!.data);

      // return parsedResponse.eventList; //dart List<Evemt>object
      final ResponseModel response = await _httpService.getRequest('/events/');
      print('1');
      print(response.toJson());
      return response.eventList!.eventList;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }
}
