import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:my_own_clean_architecture/core/dependency_injection/main_injection.dart';
import 'package:my_own_clean_architecture/core/state/app_states.dart';
import 'package:my_own_clean_architecture/features/all_books/business/enities/book_entity.dart';

import '../../../../core/network/error_handling/failure_model.dart';
import '../../data/models/all_books_response.dart';
import '../../data/repository/all_books_repository.dart';

class AllBooksProvider extends ChangeNotifier {
  ///
  AppStates _allBooksPageState = AppStates.idle;
  AppStates get allBooksPageState => _allBooksPageState;

  ///
  String _failureMessage = '';
  String get failureMessage => _failureMessage;

  ///
  List<BookEntity> _allBooks = [];
  List<BookEntity> get allBooks => _allBooks;

  Future<void> getAllBooks() async {
    if(_allBooksPageState == AppStates.loading) return;
    changeAllBooksPageState(AppStates.loading);

    Either<FailureModel, AllBooksResponse> response =
        await getIt<AllBooksRepository>().getAllBooks();

    response.fold(
      (failure) => _handleError(failure),
      (allBooksResponse) {
        if (allBooksResponse.data == null) {
          changeAllBooksPageState(AppStates.failure);
          return;
        }
        if (allBooksResponse.data!.isEmpty) {
          changeAllBooksPageState(AppStates.empty);
          return;
        }

        _allBooks = allBooksResponse.data!
            .map((book) => BookEntity.fromAllBooksResponseModel(book))
            .toList();

        changeAllBooksPageState(AppStates.success);
      },
    );
  }

  void changeAllBooksPageState(AppStates appState) {
    _allBooksPageState = appState;
    notifyListeners();
  }

  void _handleError(FailureModel failure) {
    _failureMessage = failure.message;
    changeAllBooksPageState(AppStates.failure);
  }
}
