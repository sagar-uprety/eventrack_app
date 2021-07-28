import 'package:get/get.dart';

import '../../../global_widgets/message.dart';
import '../../../models/event/event.dart';
import '../../../models/organization/organization.dart';
import '../../../models/response.dart';
import '../../../models/user/user.dart';
import '../../../routes/app_pages.dart';
import '../../../services/shared_prefs.dart';
import '../provider/home_pro_impl.dart';
import '../provider/home_provider.dart';

class InitLoadController extends GetxController {
  late HomeProvider _provider;

  late Rx<User> _currentUser;
  late RxList<Event> _events;
  late Rx<Organization> _organization;

  User get currentUser => _currentUser.value;
  List<Event> get events => _events;
  Organization get organization => _organization.value;

  late String? authToken;
  @override
  void onInit() async {
    _provider = Get.find<HomeProviderImpl>();
    _currentUser = User().obs;
    _organization = Organization().obs;
    _events = <Event>[].obs;
    await getAuthToken();
    super.onInit();
  }

  InitLoadController() {
    _provider = Get.find<HomeProviderImpl>();
    _currentUser = User().obs;
    _organization = Organization().obs;
    _events = <Event>[].obs;
    getAuthToken().then((value) => print('All Set'));
    super.onInit();
  }

  Future getAuthToken() async {
    authToken = await SharedPreference.getAuthState();
    if (authToken == null) {
      Get.toNamed(Routes.LOGIN);
    } else {
      await getCurrentUser();
    }
  }

  Future getCurrentUser() async {
    final ResponseModel? response = await _provider.getCurrentUser();
    FlashMessage(response!.state,
        message: response.message, displayOnSuccess: false);
    if (response.state) {
      if (response.user!.isVerified!) {
        await getuser(
          user: response.user!,
          events: response.eventList!,
          organization: response.organization,
        );
        Get.toNamed(Routes.USERDASHBOARD);
      } else
        Get.toNamed(Routes.TOKEN_VERIFCATION,
            arguments: {'email': response.user!.email, 'type': 'email'});
    } else
      await SharedPreference.requestLogout();
  }

  updateUser(User user) => _currentUser.value = user;

  updateEvents(List<Event> events) => _events.value = events;

  updateOrganization(Organization organization) =>
      _organization.value = organization;

  getuser({
    required User user,
    Organization? organization,
    List<Event> events = const [],
  }) {
    updateUser(user);
    if (events.length > 0) updateEvents(events);
    if (user.organization != null) {
      updateOrganization(organization!);
    }
    update();
  }

  removeCurrentData() {
    _currentUser.value = User();
    _organization.value = Organization();
    _events.value = [];
  }
}
