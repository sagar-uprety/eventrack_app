// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organization.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Organization _$OrganizationFromJson(Map<String, dynamic> json) {
  return Organization(
    id: json['_id'] as String?,
    name: json['name'] as String?,
    email: json['email'] as String?,
    description: json['description'] as String?,
    profile: json['profile'] as String?,
    contact:
        (json['contact'] as List<dynamic>?)?.map((e) => e as String).toList(),
    address: json['address'] as String?,
    website: json['website'] as String?,
    events:
        (json['events'] as List<dynamic>?)?.map((e) => e as String).toList(),
    verificationState: json['verificationState'] == null
        ? null
        : VerificationState.fromJson(
            json['verificationState'] as Map<String, dynamic>),
    blockStatus: json['blockStatus'] == null
        ? null
        : BlockStatus.fromJson(json['blockStatus'] as Map<String, dynamic>),
    documentUrl: json['documentUrl'] as String?,
  );
}

Map<String, dynamic> _$OrganizationToJson(Organization instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('_id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('email', instance.email);
  writeNotNull('description', instance.description);
  writeNotNull('profile', instance.profile);
  writeNotNull('address', instance.address);
  writeNotNull('contact', instance.contact);
  writeNotNull('website', instance.website);
  writeNotNull('events', instance.events);
  writeNotNull('verificationState', instance.verificationState?.toJson());
  writeNotNull('blockStatus', instance.blockStatus?.toJson());
  writeNotNull('documentUrl', instance.documentUrl);
  return val;
}

VerificationState _$VerificationStateFromJson(Map<String, dynamic> json) {
  return VerificationState(
    isVerified: json['isVerified'] as bool,
    verifiedBy: json['verifiedBy'] == null
        ? null
        : User.fromJson(json['verifiedBy'] as Map<String, dynamic>),
    date: json['date'] as String?,
  );
}

Map<String, dynamic> _$VerificationStateToJson(VerificationState instance) =>
    <String, dynamic>{
      'isVerified': instance.isVerified,
      'verifiedBy': instance.verifiedBy,
      'date': instance.date,
    };

BlockStatus _$BlockStatusFromJson(Map<String, dynamic> json) {
  return BlockStatus(
    isBlocked: json['isBlocked'] as bool,
    from: json['from'] as String?,
    to: json['to'] as String?,
  );
}

Map<String, dynamic> _$BlockStatusToJson(BlockStatus instance) =>
    <String, dynamic>{
      'isBlocked': instance.isBlocked,
      'from': instance.from,
      'to': instance.to,
    };
