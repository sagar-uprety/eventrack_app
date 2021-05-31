// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventList _$EventListFromJson(Map<String, dynamic> json) {
  return EventList(
    (json['data'] as List<dynamic>)
        .map((e) => Event.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$EventListToJson(EventList instance) => <String, dynamic>{
      'data': instance.eventList,
    };
