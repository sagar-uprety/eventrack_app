import '../../../models/response.dart';

abstract class TokenVerificationProvider {
  Future<ResponseModel?> sendToken(Map<String, dynamic> data);
  Future<ResponseModel?> verifyToken(Map<String, dynamic> data);
}
