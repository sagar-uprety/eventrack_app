import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

//?run flutter pub run build_runner build in terminal to generate corresponding model.g.dart file
//!run above command everytime model is changed

//TODO: add other fields

@JsonSerializable()
class User {
  User(this.profileImage, this.username, this.email, this.password, this.phoneNo, this.address, this.gender);

  @JsonKey(name: "profileImage")
  final String profileImage;

  @JsonKey(name: "username")
  final String username;

  @JsonKey(name: "email")
  final String email;

  @JsonKey(name: "password")
  final String password;

  @JsonKey(name: "phoneNo")
  final String phoneNo;

  @JsonKey(name: "address")
  final String address;

  @JsonKey(name: "gender")
  final String gender;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
