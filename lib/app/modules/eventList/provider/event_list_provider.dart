import '../../../models/event/event.dart';

abstract class EventListProvider {
  Future<List<Event>?> getEventList();
}
