import 'package:eventrack_app/app/models/organization/organization.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

//?run flutter pub run build_runner build in terminal to generate corresponding model.g.dart file
//!run above command everytime model is changed

//TODO: add roles

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class User {
  User({
    this.profileImage,
    this.name,
    this.email,
    this.password,
    this.phone,
    this.address,
    this.gender,
    this.blockStatus,
    this.registeredEvents,
    this.favourites,
  });

  final String? profileImage;

  final String? name;

  final String? email;

  final String? password;

  final String? phone;

  final String? address;

  final String? gender;

  // final Organization? organization;

  final List<String>? registeredEvents;

  final List<String>? favourites;

  final BlockStatus? blockStatus;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
