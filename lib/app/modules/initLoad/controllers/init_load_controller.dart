import 'package:eventrack_app/app/models/event/event.dart';
import 'package:eventrack_app/app/models/organization/organization.dart';
import 'package:eventrack_app/app/models/user/user.dart';
import 'package:get/get.dart';

import '../../../global_widgets/message.dart';
import '../../../models/response.dart';
import '../../../routes/app_pages.dart';
import '../../../services/shared_prefs.dart';
import '../provider/home_pro_impl.dart';
import '../provider/home_provider.dart';
import '../../token_verifcation/views/token_verifcation_view.dart';

class InitLoadController extends GetxController {
  late HomeProvider _provider;

  late User _currentUser;
  late List<Event> _events;
  late Organization _organization;

  User get currentUser => _currentUser;
  List<Event> get events => _events;
  Organization get organization => _organization;

  late String? authToken;
  @override
  void onInit() async {
    _provider = Get.find<HomeProviderImpl>();
    _currentUser = User();
    _organization = Organization();
    _events = [];
    await getAuthToken();
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
    print('Making reques');
    FlashMessage(response!.state,
        message: response.message, displayOnSuccess: false);
    if (response.state) {
      await getuser(
        user: response.user!,
        events: response.eventList!,
        organization: response.organization,
      );
      Get.offAllNamed(Routes.USERDASHBOARD);
      // if (response.user!.isVerified!) {
      //   await _controller.getuser(
      //     user: response.user!,
      // events: response.eventList!,
      //     organization: response.organization,
      //   );
      //   Get.offAllNamed(Routes.USERDASHBOARD);
      // } else
      //   Get.offAllNamed(Routes.TOKEN_VERIFCATION);
    } else
      await SharedPreference.requestLogout();
  }

  updateUser(User user) => _currentUser = user;

  updateEvents(List<Event> events) => _events = events;

  updateOrganization(Organization organization) => _organization = organization;

  Future getuser({
    required User user,
    Organization? organization,
    List<Event> events = const [],
  }) async {
    updateUser(user);
    if (events.length > 0) updateEvents(events);
    print(events[0].toJson());
    if (user.organization != null) {
      updateOrganization(organization!);
    }
    update();
  }

  removeCurrentData() {
    _currentUser = User();
    _organization = Organization();
    _events = [];
  }
}
