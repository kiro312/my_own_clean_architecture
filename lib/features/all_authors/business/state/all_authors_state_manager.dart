import 'package:flutter/material.dart';
import 'package:my_own_clean_architecture/core/state/app_states.dart';
import 'package:provider/provider.dart';

import '../Entity/author_entity.dart';
import 'all_authors_provider.dart';

class AllAuthorsStateManager {
  static AppStates getAllAuthorsState(BuildContext context) {
    return Provider.of<AllAuthorsProvider>(context, listen: true)
        .allAuthorsPageState;
  }

  static List<AuthorEntity> getAllAuthorsList(BuildContext context) {
    return Provider.of<AllAuthorsProvider>(context, listen: true).allAuthors;
  }

  static fetchAllAuthorsFirstTime(BuildContext context) {
    if (Provider.of<AllAuthorsProvider>(context, listen: false)
        .allAuthors
        .isEmpty) {
      Provider.of<AllAuthorsProvider>(context, listen: false).getAllAuthors();
    }
  }

  static String getFailureMessage(BuildContext context) {
    return Provider.of<AllAuthorsProvider>(context, listen: true)
        .failureMessage;
  }
}
