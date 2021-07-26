import 'package:eventrack_app/app/models/response.dart';

import '../../../models/event/event.dart';

abstract class EventDetailProvider {
  Future<ResponseModel?> registerToEvent(String id);
}
