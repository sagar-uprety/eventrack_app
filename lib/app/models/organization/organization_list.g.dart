// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organization_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrganizationList _$OrganizationListFromJson(Map<String, dynamic> json) {
  return OrganizationList(
    (json['organization_list'] as List<dynamic>)
        .map((e) => Organization.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$OrganizationListToJson(OrganizationList instance) =>
    <String, dynamic>{
      'organization_list': instance.organizationList,
    };
