import 'package:json_annotation/json_annotation.dart';

part 'all_authors_response.g.dart';

@JsonSerializable()
class AllAuthorsResponse {
  String? message;
  bool? status;
  List<Data>? data;

  AllAuthorsResponse({this.message, this.status, this.data});

  factory AllAuthorsResponse.fromJson(Map<String, dynamic> json) =>
      _$AllAuthorsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AllAuthorsResponseToJson(this);
}

@JsonSerializable()
class Data {
  int? id;
  @JsonKey(name: 'authorEmail')
  String? authorEmail;
  @JsonKey(name: 'authorBio')
  String? authorBio;
  @JsonKey(name: 'authorName')
  String? authorName;

  Data({this.id, this.authorEmail, this.authorBio, this.authorName});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
