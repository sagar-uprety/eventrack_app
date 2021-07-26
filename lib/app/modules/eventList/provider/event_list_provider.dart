import 'package:eventrack_app/app/models/response.dart';

import '../../../models/event/event.dart';

abstract class EventListProvider {
  Future<List<Event>?> getEventList();
  Future<ResponseModel?> getSearchList({Map<String, dynamic> data});
}
