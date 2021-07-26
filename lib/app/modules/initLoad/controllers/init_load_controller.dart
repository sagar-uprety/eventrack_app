import 'package:get/get.dart';

import '../../../controllers/controllers/global_controller.dart';
import '../../../global_widgets/message.dart';
import '../../../models/response.dart';
import '../../../routes/app_pages.dart';
import '../../../services/shared_prefs.dart';
import '../provider/home_pro_impl.dart';
import '../provider/home_provider.dart';
import '../../token_verifcation/views/token_verifcation_view.dart';

class InitLoadController extends GetxController {
  late HomeProvider _provider;
  late GlobalController _controller;

  late String? authToken;
  @override
  void onInit() async {
    _provider = Get.find<HomeProviderImpl>();
    _controller = Get.find<GlobalController>();
    await getAuthToken();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

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
      if (response.user!.isVerified!) {
        await _controller.getuser(
          user: response.user!,
          // events: response.eventList!,
          organization: response.organization,
        );
        Get.offAllNamed(Routes.USERDASHBOARD);
      } else
        Get.offAllNamed(Routes.TOKEN_VERIFCATION);
    } else
      await SharedPreference.requestLogout();
  }
}
