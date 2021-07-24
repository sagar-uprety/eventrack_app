import 'package:eventrack_app/app/controllers/provider/user_pro_impl.dart';
import 'package:eventrack_app/app/controllers/provider/user_provider.dart';
import 'package:eventrack_app/app/global_widgets/message.dart';
import 'package:eventrack_app/app/models/response.dart';
import 'package:eventrack_app/app/models/user/user.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  late UserProvider _provider;

  late Rx<User> _currentUser;

  User get currentUser => _currentUser.value;

  @override
  void onInit() {
    _provider = Get.find<UserProviderImpl>() as UserProvider;
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