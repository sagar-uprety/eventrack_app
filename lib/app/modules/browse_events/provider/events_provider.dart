import '../../../models/event.dart';

//TODO: searchEvents and FilterEvents
abstract class EventsProvider {
  Future<List<Event>?> getEventList();
}
