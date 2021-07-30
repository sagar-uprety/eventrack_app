// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) {
  return Event(
    id: json['_id'] as String?,
    title: json['title'] as String?,
    description: json['description'] as String?,
    eventProfile: json['eventProfile'] as String?,
    categories: (json['categories'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    maxParticipants: json['maxParticipants'] as int?,
    dateTime: json['dateTime'] == null
        ? null
        : TimeDate.fromJson(json['dateTime'] as Map<String, dynamic>),
    location: json['location'] == null
        ? null
        : Location.fromJson(json['location'] as Map<String, dynamic>),
    author: json['author'] as String?,
    verificationState: json['verificationState'] == null
        ? null
        : VerificationState.fromJson(
            json['verificationState'] as Map<String, dynamic>),
    registeredUsers: (json['registeredUsers'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
  );
}

Map<String, dynamic> _$EventToJson(Event instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('_id', instance.id);
  writeNotNull('title', instance.title);
  writeNotNull('description', instance.description);
  writeNotNull('eventProfile', instance.eventProfile);
  writeNotNull('categories', instance.categories);
  writeNotNull('dateTime', instance.dateTime?.toJson());
  writeNotNull('maxParticipants', instance.maxParticipants);
  writeNotNull('location', instance.location?.toJson());
  writeNotNull('author', instance.author);
  writeNotNull('verificationState', instance.verificationState?.toJson());
  writeNotNull('registeredUsers', instance.registeredUsers);
  return val;
}

TimeDate _$TimeDateFromJson(Map<String, dynamic> json) {
  return TimeDate(
    dates: (json['dates'] as List<dynamic>).map((e) => e as String).toList(),
    times: (json['times'] as List<dynamic>).map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$TimeDateToJson(TimeDate instance) => <String, dynamic>{
      'dates': instance.dates,
      'times': instance.times,
    };

Location _$LocationFromJson(Map<String, dynamic> json) {
  return Location(
    latitude: (json['latitude'] as num).toDouble(),
    longitude: (json['longitude'] as num).toDouble(),
    location: json['location'] as String,
  );
}

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'location': instance.location,
    };
