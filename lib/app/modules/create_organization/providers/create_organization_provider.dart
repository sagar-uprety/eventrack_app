import 'package:dio/dio.dart' as Dio;

import '../../../models/response.dart';

abstract class CreateOrganizationProvider {
  Future<ResponseModel?> createOrganization(Dio.FormData data);
}
