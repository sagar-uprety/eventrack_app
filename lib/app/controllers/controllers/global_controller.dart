import 'package:get/get.dart';

import '../../models/event/event.dart';
import '../../models/organization/organization.dart';
import '../../models/user/user.dart';

class GlobalController extends GetxController {
  late User _currentUser;
  late List<Event?> _events;
  late Organization _organization;

  User get currentUser => _currentUser;
  List<Event?> get events => _events;
  Organization get organization => _organization;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  updateUser(User user) => _currentUser = user;

  updateEvents(List<Event?> events) => _events = events;

  updateOrganization(Organization organization) => _organization = organization;

  Future getuser({
    required User user,
    // Organization? organization,
    // required List<Event?> events,
  }) async {
    updateUser(user);
    // updateEvents(events);
    // if (organization != null) updateOrganization(organization);
    update();
  }
}
