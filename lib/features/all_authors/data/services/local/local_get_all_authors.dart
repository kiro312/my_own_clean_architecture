
import 'package:dartz/dartz.dart';
import 'package:my_own_clean_architecture/features/all_authors/data/data_source/local/all_authors_local_api.dart';

import '../../../../../core/network/error_handling/failure_model.dart';
import '../../models/all_authors_response.dart';

extension ExceptionLogging on Exception {
  void logMessage() {
    // Customize your logging logic here
    // ignore: avoid_print
    print('Exception occurred:');
  }
}

class LocalGetAllAuthors {
  final AllAuthorsLocalApi allAuthorsLocalApi;

  LocalGetAllAuthors(this.allAuthorsLocalApi);

  Future<Either<FailureModel, AllAuthorsResponse>> call() async {
    try {
      return Right(await allAuthorsLocalApi.getLastAllAuthors());
    } catch (e) {
      return Left(
        FailureModel.handleErrors(
          error: e,
          defaultMessage: "An error occurred while getting all authors",
        ),
      );
    }
  }
}
