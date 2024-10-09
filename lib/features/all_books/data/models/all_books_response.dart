import 'package:json_annotation/json_annotation.dart';

part 'all_books_response.g.dart';

@JsonSerializable()
class AllBooksResponse {
  String? message;
  bool? status;
  List<Data>? data;

  AllBooksResponse({this.message, this.status, this.data});

  factory AllBooksResponse.fromJson(Map<String, dynamic> json) =>
      _$AllBooksResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AllBooksResponseToJson(this);
}

@JsonSerializable()
class Data {
  int? id;
  @JsonKey(name: 'bookImage')
  String? bookImage;
  @JsonKey(name: 'bookAuthor')
  BookAuthor? bookAuthor;
  @JsonKey(name: 'bookTitle')
  String? bookTitle;
  @JsonKey(name: 'bookDescription')
  String? bookDescription;

  Data(
      {this.id,
      this.bookImage,
      this.bookAuthor,
      this.bookTitle,
      this.bookDescription});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class BookAuthor {
  int? id;
  @JsonKey(name: 'authorName')
  String? authorName;
  @JsonKey(name: 'authorEmail')
  String? authorEmail;
  @JsonKey(name: 'authorBio')
  String? authorBio;

  BookAuthor({this.id, this.authorName, this.authorEmail, this.authorBio});

  factory BookAuthor.fromJson(Map<String, dynamic> json) =>
      _$BookAuthorFromJson(json);

  Map<String, dynamic> toJson() => _$BookAuthorToJson(this);
}
