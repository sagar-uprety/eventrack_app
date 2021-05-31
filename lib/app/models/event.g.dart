// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) {
  return Event(
    json['title'] as String,
    json['description'] as String,
    json['image'] as String,
    json['createdAt'] as String,
  );
}

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'title': instance.eventTitle,
      'description': instance.eventDescription,
      'image': instance.eventImgUrl,
      'createdAt': instance.eventPubDate,
    };
