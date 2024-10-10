import 'package:my_own_clean_architecture/features/all_authors/data/models/all_authors_response.dart';

class AuthorEntity {
  int? id;
  String? authorEmail;
  String? authorBio;
  String? authorName;

  AuthorEntity({this.id, this.authorEmail, this.authorBio, this.authorName});

  AuthorEntity.fromAllBooksResponseModel(Data authorModel) {
    id = authorModel.id ?? 0;
    authorEmail = authorModel.authorEmail ?? '';
    authorBio = authorModel.authorBio ?? '';
    authorName = authorModel.authorName ?? '';
  }
}
