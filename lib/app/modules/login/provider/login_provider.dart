import '../../../models/response.dart';

abstract class LoginProvider {
  Future<ResponseModel?> loginUser({Map<String, dynamic> data});
}
