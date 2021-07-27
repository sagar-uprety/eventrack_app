import '../../../models/event/event.dart';
import '../../../models/response.dart';

abstract class EventListProvider {
  Future<List<Event>?> getEventList();
  Future<ResponseModel?> getSearchList({Map<String, dynamic> data});
}
