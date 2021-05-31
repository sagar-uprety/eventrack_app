import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

//?run flutter pub run build_runner build in terminal to generate corresponding model.g.dart file
//!run above command everytime model is changed

//TODO: add other fields

@JsonSerializable()
class User {
  User(this.eventTitle, this.eventDescription, this.eventImgUrl);

  @JsonKey(name: "username")
  final String eventTitle;

  @JsonKey(name: "email")
  final String eventDescription;

  @JsonKey(name: "password")
  final String eventImgUrl;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
