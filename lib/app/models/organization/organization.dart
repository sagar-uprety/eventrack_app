import 'package:json_annotation/json_annotation.dart';

import '../user/user.dart';

part 'organization.g.dart';

//?run flutter pub run build_runner build in terminal to generate corresponding model.g.dart file
//!run above command everytime model is changed

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class Organization {
  @JsonKey(name: '_id')
  final String? id;
  final String? name;
  final String? email;
  final String? description;
  final String? profile;
  final String? address;
  final List<String>? contact;
  final String? website;
  final List<String>? events;
  final VerificationState? verificationState;
  final BlockStatus? blockStatus;

  ///This is a `URL`
  final String? documentUrl;

  ///This is a `File`
  // @JsonConverter()
  // final File? documentFile;

  Organization({
    this.id,
    this.name,
    this.email,
    this.description,
    this.profile,
    this.contact,
    this.address,
    this.website,
    this.events,
    this.verificationState,
    this.blockStatus,
    this.documentUrl,
    // this.documentFile,
  });

  factory Organization.fromJson(Map<String, dynamic> json) =>
      _$OrganizationFromJson(json);

  Map<String, dynamic> toJson() => _$OrganizationToJson(this);
}

@JsonSerializable()
class VerificationState {
  final bool isVerified;
  final User? verifiedBy;
  final String? date;

  VerificationState({required this.isVerified, this.verifiedBy, this.date});

  factory VerificationState.fromJson(Map<String, dynamic> json) =>
      _$VerificationStateFromJson(json);

  Map<String, dynamic> toJson() => _$VerificationStateToJson(this);
}

@JsonSerializable()
class BlockStatus {
  final bool isBlocked;
  final String? from;
  final String? to;

  BlockStatus({required this.isBlocked, this.from, this.to});

  factory BlockStatus.fromJson(Map<String, dynamic> json) =>
      _$BlockStatusFromJson(json);

  Map<String, dynamic> toJson() => _$BlockStatusToJson(this);
}
