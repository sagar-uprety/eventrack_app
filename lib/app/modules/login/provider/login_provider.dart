import 'package:eventrack_app/app/models/response.dart';

//TODO: searchEvents and FilterEvents

abstract class LoginProvider {
  Future<ResponseModel?> loginUser({Map<String, dynamic> data});
}
