import 'package:eventrack_app/app/models/event/event.dart';

//TODO: searchEvents and FilterEvents
abstract class EventsProvider {
  Future<List<Event>?> getEventList();
}
