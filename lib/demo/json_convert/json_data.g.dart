// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JsonData _$JsonDataFromJson(Map<String, dynamic> json) {
  return JsonData(
    by: json['by'] as String,
    descendants: json['descendants'] as int,
    id: json['id'] as int,
    kids: (json['kids'] as List)?.map((e) => e as int)?.toList(),
    score: json['score'] as int,
    time: json['time'] as int,
    title: json['title'] as String,
    type: json['type'] as String,
    url: json['url'] as String,
  );
}

Map<String, dynamic> _$JsonDataToJson(JsonData instance) => <String, dynamic>{
      'by': instance.by,
      'descendants': instance.descendants,
      'id': instance.id,
      'kids': instance.kids,
      'score': instance.score,
      'time': instance.time,
      'title': instance.title,
      'type': instance.type,
      'url': instance.url,
    };
