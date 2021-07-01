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
    userList: json['user_list'] == null
        ? null
        : UserList.fromJson(json['user_list'] as Map<String, dynamic>),
    eventList: json['event_list'] == null
        ? null
        : EventList.fromJson(json['event_list'] as Map<String, dynamic>),
    organizationList: json['organization_list'] == null
        ? null
        : OrganizationList.fromJson(
            json['organization_list'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ResponseModelToJson(ResponseModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('message', instance.message);
  val['state'] = instance.state;
  writeNotNull('user', instance.user?.toJson());
  writeNotNull('organization', instance.organization?.toJson());
  writeNotNull('event', instance.event?.toJson());
  writeNotNull('user_list', instance.userList?.toJson());
  writeNotNull('event_list', instance.eventList?.toJson());
  writeNotNull('organization_list', instance.organizationList?.toJson());
  return val;
}
