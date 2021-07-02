import 'package:json_annotation/json_annotation.dart';

import 'event.dart';

part 'event_list.g.dart';

//?run flutter pub run build_runner build in terminal to generate corresponding model.g.dart file
//!run above command everytime model is changed

@JsonSerializable()
class EventList {
  EventList(this.eventList);

  //this key is taken from our response in server.
  @JsonKey(name: "event_list")
  List<Event> eventList;

  factory EventList.fromJson(Map<String, dynamic> json) =>
      _$EventListFromJson(json);
  Map<String, dynamic> toJson() => _$EventListToJson(this);
}
