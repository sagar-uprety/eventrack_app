import '../../models/response.dart';

abstract class UserProvider {
  Future<ResponseModel?> getCurrentUser();
}
