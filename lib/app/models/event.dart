import 'package:json_annotation/json_annotation.dart';
part 'event.g.dart';

//?run flutter pub run build_runner build in terminal to generate corresponding model.g.dart file
//!run above command everytime model is changed

//TODO: Add other fields
@JsonSerializable()
class Event {
  Event(this.eventTitle, this.eventDescription, this.eventImgUrl,
      this.eventPubDate);

  @JsonKey(name: "title")
  final String eventTitle;

  @JsonKey(name: "description")
  final String eventDescription;

  @JsonKey(name: "image")
  final String eventImgUrl;

  @JsonKey(name: "createdAt")
  final String eventPubDate;

  DateTime? get getPubDate => DateTime.tryParse(eventPubDate);

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
  Map<String, dynamic> toJson() => _$EventToJson(this);

  //run flutter pub run build_runner build in terminal to generate corresponding model.g.dart file
  //run this everytime model is changed
}
