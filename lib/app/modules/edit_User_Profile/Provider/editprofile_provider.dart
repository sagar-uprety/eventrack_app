import '../../../models/response.dart';

abstract class EditprofileProvider {
  Future<ResponseModel?> userProfile({Map<String, dynamic> data});
}
