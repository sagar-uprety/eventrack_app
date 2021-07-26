import 'package:eventrack_app/app/models/response.dart';

abstract class EventDetailProvider {
  Future<ResponseModel?> registerToEvent(String id);
}
