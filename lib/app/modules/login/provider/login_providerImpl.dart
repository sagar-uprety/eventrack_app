import 'package:eventrack_app/app/models/user/user.dart';
import 'package:get/get.dart';

import '../../../services/http_service.dart';
import '../../../services/http_service_impl.dart';
import 'login_provider.dart';

class LoginProviderImpl implements LoginProvider {
  late HttpService _httpService;

  //Add this to binding so that we can use it in controller or view
  LoginProviderImpl() {
    _httpService = Get.put(HttpImplementation());
    _httpService.init();
  }

  @override
  Future<User?> registerUser({Map<String, dynamic>? data}) async {
    try {
      //*This is where it uses our HttpService class to make dio requests and call API (backend)
      print(data);
      final response =
          await _httpService.postRequest('/auth/signup', data: data);

      //*Now converting JSON Response to Dart Object. See Models to see how it's done
      final parsedResponse = User.fromJson(response!.data);

      // return parsedResponse.eventList; //dart List<Evemt>object
    } on Exception catch (e) {
      print(e);
      return null;
    }
    throw UnimplementedError();
  }
}
