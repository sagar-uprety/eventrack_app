import 'package:eventrack_app/app/models/response.dart';

abstract class UserProvider {
  Future<ResponseModel?> getCurrentUser();
}
