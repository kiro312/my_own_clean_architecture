// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_authors_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllAuthorsResponse _$AllAuthorsResponseFromJson(Map<String, dynamic> json) =>
    AllAuthorsResponse(
      message: json['message'] as String?,
      status: json['status'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AllAuthorsResponseToJson(AllAuthorsResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: (json['id'] as num?)?.toInt(),
      authorEmail: json['authorEmail'] as String?,
      authorBio: json['authorBio'] as String?,
      authorName: json['authorName'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'authorEmail': instance.authorEmail,
      'authorBio': instance.authorBio,
      'authorName': instance.authorName,
    };
