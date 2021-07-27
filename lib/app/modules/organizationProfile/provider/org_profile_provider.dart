import '../../../models/response.dart';

abstract class OrgProfileProvider {
  Future<ResponseModel?> getCreatedEvents(String id);
}
