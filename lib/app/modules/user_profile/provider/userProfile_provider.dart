import 'package:dio/dio.dart' as Dio;

import '../../../models/response.dart';

abstract class UserProfileProvider {
  Future<ResponseModel> uploadCover(Dio.FormData data);
}
