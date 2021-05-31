import 'package:get/get.dart';

import '../provider/events_pro_impl.dart';
import '../provider/events_provider.dart';

import '../../../models/event.dart';

class BrowseEventsController extends GetxController {
  late EventsProvider _eventsProvider;

  BrowseEventsController() {
    _eventsProvider = Get.find<EventsProviderImpl>();
    loadNewsList();
  }

  //These are vars that change and we need to update according. That's why we use Rx-type (GetX)
  RxBool isLoading = false.obs;
  RxList<Event>? eventList;

  loadNewsList() async {
    showLoading();
    //call to Provider Method which in turn call to our API
    final result = await _eventsProvider.getEventList();
    //this result is already parsed and is converted to List<Events>
    if (result != null) {
      eventList = result.obs;
      hideLoading();
    } else {
      print("Data Not Found");
      hideLoading();
    }
  }

  showLoading() => isLoading.toggle();
  hideLoading() => isLoading.toggle();
}
