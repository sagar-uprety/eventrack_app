import './event.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event_list.g.dart';

//?run flutter pub run build_runner build in terminal to generate corresponding model.g.dart file
//!run above command everytime model is changed

@JsonSerializable()
class EventList {
  EventList(this.eventList);

  @JsonKey(name: "data")
  List<Event> eventList;

  factory EventList.fromJson(Map<String, dynamic> json) =>
      _$EventListFromJson(json);
  Map<String, dynamic> toJson() => _$EventListToJson(this);
}
