import 'package:dio/dio.dart' as Dio;
import 'package:eventrack_app/app/global_widgets/message.dart';
import 'package:get/get.dart';

import '../../../models/response.dart';
import '../../../services/http_service.dart';
import '../../../services/http_service_impl.dart';
import './event_detail_provider.dart';

class EventDetailProviderImpl implements EventDetailProvider {
  late HttpService _httpService;

  //Add this to binding so that we can use it in controller or view
  EventDetailProviderImpl() {
    _httpService = Get.put(HttpImplementation());
    _httpService.init();
  }

  @override
  Future<ResponseModel?> registerToEvent(String id) async {
    try {
      final ResponseModel response =
          await _httpService.postRequest('/events/$id');

      return response;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<ResponseModel?> getParticipants(String id) async {
    try {
      final ResponseModel response =
          await _httpService.getRequest('/events/participants/$id');
      return response;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<ResponseModel> addtoFavourites(String id) async {
    final ResponseModel response =
        await _httpService.postRequest('/user/myfavourites/$id');

    return response;
  }

  @override
  Future<ResponseModel> uploadProfile(String id, Dio.FormData data) async {
    final ResponseModel response =
        await _httpService.postRequest('/events/uploadProfile/$id', data: data);

    return response;
  }
}
