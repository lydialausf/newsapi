part of 'source_response.dart';

SourceResponse _$SourceResponseFromJson(Map<String, dynamic> json) =>
    SourceResponse(
      id: json['id'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$SourceResponseToJson(SourceResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
