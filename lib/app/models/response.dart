import 'package:eventrack_app/app/models/event/event_list.dart';
import 'package:eventrack_app/app/models/organization/organization_list.dart';
import 'package:eventrack_app/app/models/user/user_list.dart';
import 'package:json_annotation/json_annotation.dart';

import 'event/event.dart';
import 'organization/organization.dart';
import 'user/user.dart';

part 'response.g.dart';

//?run flutter pub run build_runner build in terminal to generate corresponding model.g.dart file
//!run above command everytime model is changed

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class ResponseModel {
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'state')
  final bool state;
  @JsonKey(name: 'user')
  final User? user;
  @JsonKey(name: 'organization')
  final Organization? organization;
  @JsonKey(name: 'event')
  final Event? event;
  @JsonKey(name: 'user_list')
  final UserList? userList;
  @JsonKey(name: 'event_list')
  final EventList? eventList;
  @JsonKey(name: 'organization_list')
  final OrganizationList? organizationList;

  ResponseModel(
      {this.message,
      this.state = false,
      this.user,
      this.organization,
      this.event,
      this.userList,
      this.eventList,
      this.organizationList});

  factory ResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseModelToJson(this);
}
