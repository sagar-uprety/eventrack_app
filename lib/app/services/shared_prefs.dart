import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../routes/app_pages.dart';

class SharedPreference {
  static saveAuthState(String token) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setString('auth-token', token);

    return;
  }

  static getAuthState() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? authToken;
    if (_prefs.containsKey('auth-token')) {
      authToken = _prefs.getString('auth-token');
      return authToken;
    }
    return;
  }

  static deleteAuthState() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    if (_prefs.containsKey('auth-token')) _prefs.remove('auth-token');
    return;
  }

  static requestLogout() async {
    await deleteAuthState();
    Get.offNamedUntil(Routes.LOGIN, (route) => true);
    return;
  }
}
