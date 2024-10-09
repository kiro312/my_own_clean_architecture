import 'package:flutter/material.dart';
import 'package:my_own_clean_architecture/features/all_books/business/enities/book_entity.dart';
import 'package:my_own_clean_architecture/features/all_books/business/state/all_books_state_manager.dart';

class BooksListWidget extends StatelessWidget {
  const BooksListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: AllBooksStateManager.getAllBooksList(context).length,
      itemBuilder: (context, index) {
        final book = AllBooksStateManager.getAllBooksList(context)[index];
        return SingleBookWidget(
          book: book,
        );
      },
    );
  }
}

class SingleBookWidget extends StatelessWidget {
  final BookEntity book;
  const SingleBookWidget({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Image.network(
              book.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  book.authorName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
