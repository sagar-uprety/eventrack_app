import 'package:get/get.dart';

import '../../../models/event/event.dart';
import '../../../models/organization/organization.dart';
import '../../../models/response.dart';
import '../../../temp_data.dart';
import '../provider/org_profile_provider.dart';
import '../provider/org_profile_provider_impl.dart';

class OrganizationProfileController extends GetxController {
  final RxBool showMore = false.obs;
  final Organization orgData = Get.arguments;
  late OrgProfileProvider _orgProfileProvider;
  late RxList<Event> createdEventList;

  @override
  void onInit() async {
    _orgProfileProvider = Get.find<OrgProfileProviderImpl>();
    createdEventList = <Event>[].obs;
    print(orgData.toJson());
    getCreatedEventsData();
    super.onInit();
  }

  getCreatedEventsData() async {
    try {
      ResponseModel? events =
          await _orgProfileProvider.getCreatedEvents(orgData.id!);
      print('Response: ${events!.toJson()}');
      // this result is already parsed and is converted to List<Events>
      if (events.state) {
        print("Created Events data found");
        createdEventList.value = events.eventList!;
      } else {
        print("Created Events Data Not Found");
      }
    } catch (e) {
      print(e);
    }
  }

  void toggleDescriptionDisplay() => showMore.value = !showMore.value;
}
