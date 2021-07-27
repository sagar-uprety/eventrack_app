import '../../../models/response.dart';

abstract class LoginProvider {
  Future<ResponseModel> loginUser(Map<String, dynamic> data);
  Future<ResponseModel> checkEmail(Map<String, dynamic> data);
}
