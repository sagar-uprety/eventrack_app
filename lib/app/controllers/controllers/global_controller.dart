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
    _currentUser = User();
    _organization = Organization();
    _events = [];
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
    Organization? organization,
    List<Event?> events = const [],
  }) async {
    updateUser(user);
    print(currentUser.toJson());
    updateEvents(events);
    if (user.organization != null) {
      updateOrganization(organization!);
      print(organization.toJson());
    }
    update();
  }

  removeCurrentData() {
    _currentUser = User();
    _organization = Organization();
    _events = [];
  }
}
