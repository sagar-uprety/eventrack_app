import 'package:eventrack_app/app/models/user/user.dart';
import 'package:json_annotation/json_annotation.dart';
part 'organization.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class Organization {
  final String? name;
  final String? email;
  final String? description;
  final String? profile;
  final List<String>? contact;
  final String? website;
  final List<String>? events;
  final VerificationState? verificationState;
  final BlockStatus? blockStatus;

  Organization(
      {this.name,
      this.email,
      this.description,
      this.profile,
      this.contact,
      this.website,
      this.events,
      this.verificationState,
      this.blockStatus});

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
