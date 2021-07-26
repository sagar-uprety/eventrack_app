import '../../../models/response.dart';

abstract class CreateOrganizationProvider {
  Future<ResponseModel?> createOrganization(Map<String, dynamic> data);
}
