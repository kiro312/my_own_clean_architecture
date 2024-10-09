import 'package:my_own_clean_architecture/features/all_books/data/models/all_books_response.dart';

class BookEntity {
  final String title;
  final String authorName;
  final String imageUrl;

  BookEntity({
    required this.title,
    required this.authorName,
    required this.imageUrl,
  });

  factory BookEntity.fromAllBooksResponseModel(Data bookModel) {
    return BookEntity(
      title: bookModel.bookTitle ?? 'Unknown Title',
      authorName: bookModel.bookAuthor!.authorName ?? 'Unknown Author',
      imageUrl: bookModel.bookImage ?? 'Unknown Image',
    );
  }
}
