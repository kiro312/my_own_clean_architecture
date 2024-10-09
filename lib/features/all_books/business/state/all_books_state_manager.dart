import 'package:flutter/material.dart';
import 'package:my_own_clean_architecture/core/state/app_states.dart';
import 'package:my_own_clean_architecture/features/all_books/business/enities/book_entity.dart';
import 'package:provider/provider.dart';

import 'all_books_provider.dart';

class AllBooksStateManager {
  static AppStates getAllBooksState(BuildContext context) {
    return Provider.of<AllBooksProvider>(context, listen: true)
        .allBooksPageState;
  }

  static List<BookEntity> getAllBooksList(BuildContext context) {
    return Provider.of<AllBooksProvider>(context, listen: true).allBooks;
  }

  static fetchAllBooksFirstTime(BuildContext context) {
    if (Provider.of<AllBooksProvider>(context, listen: false)
        .allBooks
        .isEmpty) {
      Provider.of<AllBooksProvider>(context, listen: false).getAllBooks();
    }
  }

  static String getFailureMessage(BuildContext context) {
    return Provider.of<AllBooksProvider>(context, listen: true).failureMessage;
  }
}
