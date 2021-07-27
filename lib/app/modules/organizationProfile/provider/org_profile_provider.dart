import 'package:dio/dio.dart' as Dio;

import '../../../models/response.dart';

abstract class OrgProfileProvider {
  Future<ResponseModel?> getCreatedEvents(String id);
  Future<ResponseModel> uploadProfile(Dio.FormData data);
}
