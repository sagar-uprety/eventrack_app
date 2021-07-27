import '../../../models/response.dart';

abstract class PasswordResetProvider {
  Future<ResponseModel> changePassword(Map<String, dynamic> data);
}
