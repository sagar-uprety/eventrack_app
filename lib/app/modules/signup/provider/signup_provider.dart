import '../../../models/response.dart';

abstract class SignUpProvider {
  Future<ResponseModel?> registerUser({Map<String, dynamic> data});
}
