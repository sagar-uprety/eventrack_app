import '../../../models/event/event.dart';

//TODO: searchEvents and FilterEvents
abstract class EventsProvider {
  Future<List<Event>?> getEventList();
}
