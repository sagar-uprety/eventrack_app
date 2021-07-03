import '../../../models/response.dart';

abstract class CreateEventProvider {
  Future<ResponseModel?> createEvent(Map<String, dynamic> data);
}
