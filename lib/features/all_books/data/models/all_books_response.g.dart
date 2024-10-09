// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_books_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllBooksResponse _$AllBooksResponseFromJson(Map<String, dynamic> json) =>
    AllBooksResponse(
      message: json['message'] as String?,
      status: json['status'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AllBooksResponseToJson(AllBooksResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: (json['id'] as num?)?.toInt(),
      bookImage: json['bookImage'] as String?,
      bookAuthor: json['bookAuthor'] == null
          ? null
          : BookAuthor.fromJson(json['bookAuthor'] as Map<String, dynamic>),
      bookTitle: json['bookTitle'] as String?,
      bookDescription: json['bookDescription'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'bookImage': instance.bookImage,
      'bookAuthor': instance.bookAuthor,
      'bookTitle': instance.bookTitle,
      'bookDescription': instance.bookDescription,
    };

BookAuthor _$BookAuthorFromJson(Map<String, dynamic> json) => BookAuthor(
      id: (json['id'] as num?)?.toInt(),
      authorName: json['authorName'] as String?,
      authorEmail: json['authorEmail'] as String?,
      authorBio: json['authorBio'] as String?,
    );

Map<String, dynamic> _$BookAuthorToJson(BookAuthor instance) =>
    <String, dynamic>{
      'id': instance.id,
      'authorName': instance.authorName,
      'authorEmail': instance.authorEmail,
      'authorBio': instance.authorBio,
    };
