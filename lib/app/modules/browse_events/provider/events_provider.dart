import '../../../models/event/event.dart';

abstract class EventsProvider {
  Future<List<Event>?> getEventList();
}
