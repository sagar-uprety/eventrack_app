import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  static saveAuthState(String token) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setString('auth-token', token);
    return;
  }

  static getAuthState() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? stringValue = _prefs.getString('auth-token');
    if (stringValue != null) {
      print(stringValue);
      return stringValue;
    } else {
      print('You have been logged out');
    }
  }

  static deleteAuthState() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.remove('auth-token');
    print(_prefs);
    return;
  }
}
