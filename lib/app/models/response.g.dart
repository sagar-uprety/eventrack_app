// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseModel _$ResponseModelFromJson(Map<String, dynamic> json) {
  return ResponseModel(
    message: json['message'] as String?,
    state: json['state'] as bool,
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    organization: json['organization'] == null
        ? null
        : Organization.fromJson(json['organization'] as Map<String, dynamic>),
    event: json['event'] == null
        ? null
        : Event.fromJson(json['event'] as Map<String, dynamic>),
    userList: (json['user_list'] as List<dynamic>?)
        ?.map((e) => User.fromJson(e as Map<String, dynamic>))
        .toList(),
    eventList: (json['event_list'] as List<dynamic>?)
        ?.map((e) => Event.fromJson(e as Map<String, dynamic>))
        .toList(),
    organizationList: (json['organization_list'] as List<dynamic>?)
        ?.map((e) => Organization.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}
