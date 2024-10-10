import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/dependency_injection/main_injection.dart';
import '../../../../core/network/error_handling/failure_model.dart';
import '../../../../core/state/app_states.dart';
import '../../data/models/all_authors_response.dart';
import '../../data/repository/all_authors_repository.dart';
import '../Entity/author_entity.dart';

class AllAuthorsProvider extends ChangeNotifier {
  ///
  AppStates _allAuthorsPageState = AppStates.idle;
  AppStates get allAuthorsPageState => _allAuthorsPageState;

  ///
  String _failureMessage = '';
  String get failureMessage => _failureMessage;

  ///
  List<AuthorEntity> _allAuthors = [];
  List<AuthorEntity> get allAuthors => _allAuthors;

  void changeAllAuthorsPageState(AppStates appState) {
    _allAuthorsPageState = appState;
    notifyListeners();
  }

  void _handleError(FailureModel failure) {
    _failureMessage = failure.message;
    changeAllAuthorsPageState(AppStates.failure);
  }

  ///
  Future<void> getAllAuthors() async {
    if (_allAuthorsPageState == AppStates.loading) return;

    changeAllAuthorsPageState(AppStates.loading);

    Either<FailureModel, AllAuthorsResponse> response =
        await getIt<AllAuthorsRepository>().getAllAuthors();

    response.fold(
      (failure) => _handleError(failure),
      (allAuthorsResponse) {
        if (allAuthorsResponse.data == null) {
          changeAllAuthorsPageState(AppStates.failure);
          return;
        }
        if (allAuthorsResponse.data!.isEmpty) {
          changeAllAuthorsPageState(AppStates.empty);
          return;
        }

        _allAuthors = allAuthorsResponse.data!
            .map((author) => AuthorEntity.fromAllBooksResponseModel(author))
            .toList();

        changeAllAuthorsPageState(AppStates.success);
      },
    );
  }
}
