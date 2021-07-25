import 'package:get/get.dart';

import '../../global_widgets/message.dart';
import '../../models/response.dart';
import '../../models/user/user.dart';
import '../provider/user_pro_impl.dart';
import '../provider/user_provider.dart';

class UserController extends GetxController {
  late UserProvider _provider;

  late Rx<User> _currentUser;

  User get currentUser => _currentUser.value;

  @override
  void onInit() {
    _provider = Get.find<UserProviderImpl>();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future getuser() async {
    final ResponseModel? response = await _provider.getCurrentUser();

    FlashMessage(response!.state,
        message: response.message, displayOnSuccess: false);

    _currentUser.value = response.user!;
    update();
  }
}
