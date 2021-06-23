// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
      json['username'] as String,
      json['email'] as String,
      json['password'] as String,
      json['phoneNo'] as String,
      json['address'] as String,
      json['gender'] as String,
      json['profileImage'] as String);
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'profileImage': instance.profileImage,
      'username': instance.username,
      'email': instance.email,
      'password': instance.password,
      'phoneNo': instance.phoneNo,
      'address': instance.address,
      'gender': instance.gender,
    };
