import 'package:dio/dio.dart' as Dio;

import '../../../models/response.dart';

abstract class EventDetailProvider {
  Future<ResponseModel?> registerToEvent(String id);
  Future<ResponseModel?> getParticipants(String id);
  Future<ResponseModel> addtoFavourites(String id);
  Future<ResponseModel> uploadProfile(String id, Dio.FormData data);
}
