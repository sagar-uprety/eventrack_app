import 'package:json_annotation/json_annotation.dart';

import 'organization.dart';

part 'organization_list.g.dart';

//?run flutter pub run build_runner build in terminal to generate corresponding model.g.dart file
//!run above command everytime model is changed

@JsonSerializable()
class OrganizationList {
  OrganizationList(this.organizationList);

  //this key is taken from our response in server.
  @JsonKey(name: "organization_list")
  List<Organization> organizationList;

  factory OrganizationList.fromJson(Map<String, dynamic> json) =>
      _$OrganizationListFromJson(json);
  Map<String, dynamic> toJson() => _$OrganizationListToJson(this);
}
