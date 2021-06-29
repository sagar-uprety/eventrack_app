import '../../../models/user/user.dart';

//TODO: searchEvents and FilterEvents

abstract class LoginProvider {
  Future<User?> registerUser({Map<String, dynamic> data});
}
