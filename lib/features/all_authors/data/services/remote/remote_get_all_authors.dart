import 'package:dartz/dartz.dart';

import '../../../../../core/network/error_handling/exceptions.dart';
import '../../../../../core/network/error_handling/failure_model.dart';
import '../../data_source/local/all_authors_local_api.dart';
import '../../data_source/remote/all_authors_remote_api.dart';
import '../../models/all_authors_response.dart';

class RemoteGetAllAuthors {
  final AllAuthorsRemoteApi allAuthorsRemoteApi;
  final AllAuthorsLocalApi allAuthorsLocalApi;

  RemoteGetAllAuthors(this.allAuthorsRemoteApi, this.allAuthorsLocalApi);

  Future<Either<FailureModel, AllAuthorsResponse>> call() async {
    try {
      AllAuthorsResponse response = await allAuthorsRemoteApi.getAllAuthors();
      allAuthorsLocalApi.cacheAllAuthors(response);
      return Right(response);
    } on ServerException catch (e) {
      return Left(
        FailureModel(
            e.errorModel.serverMessage ?? "Get all Authors failed From Remote"),
      );
    } catch (e) {
      // Catch any unexpected exceptions
      return Left(
        FailureModel(
          "Unexpected error occurred: ${e.toString()}",
        ),
      );
    }
  }
}
