import 'package:json_annotation/json_annotation.dart';

import '../organization/organization.dart';

part 'event.g.dart';

//?run flutter pub run build_runner build in terminal to generate corresponding model.g.dart file
//!run above command everytime model is changed

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class Event {
  @JsonKey(name: '_id')
  final String? id;

  final String? title;

  final String? description;

  final String? eventProfile;

  final List<String>? categories;

  final TimeDate? dateTime;

  final int? maxParticipants;

  final Location? location;

  final String? author;

  final VerificationState? verificationState;

  final List<String>? registeredUsers;

  Event({
    this.id,
    this.title,
    this.description,
    this.eventProfile,
    this.categories,
    this.maxParticipants,
    this.dateTime,
    this.location,
    this.author,
    this.verificationState,
    this.registeredUsers,
  });

  // @JsonKey(name: "createdAt")
  // final String eventPubDate;

  // DateTime? get getPubDate => DateTime.tryParse(eventPubDate);

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  Map<String, dynamic> toJson() => _$EventToJson(this);

  //run flutter pub run build_runner build in terminal to generate corresponding model.g.dart file
  //run this everytime model is changed
}

@JsonSerializable()
class TimeDate {
  TimeDate({required this.dates, required this.times});
  final List<String> dates;

  final List<String> times;

  factory TimeDate.fromJson(Map<String, dynamic> json) =>
      _$TimeDateFromJson(json);

  Map<String, dynamic> toJson() => _$TimeDateToJson(this);
}

@JsonSerializable()
class Location {
  Location(
      {required this.latitude,
      required this.longitude,
      required this.location});

  final double latitude;
  final double longitude;
  final String location;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
