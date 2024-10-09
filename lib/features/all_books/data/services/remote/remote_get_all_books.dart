import 'package:dartz/dartz.dart';
import 'package:my_own_clean_architecture/core/network/error_handling/failure_model.dart';
import 'package:my_own_clean_architecture/features/all_books/data/data_source/local/all_books_local_api.dart';
import 'package:my_own_clean_architecture/features/all_books/data/models/all_books_response.dart';

import '../../../../../core/network/error_handling/exceptions.dart';
import '../../data_source/remote/all_books_remote_api.dart';

class RemoteGetAllBooks {
  final AllBooksRemoteApi allBooksRemoteApi;
  final AllBooksLocalApi localDataSource;

  RemoteGetAllBooks({
    required this.allBooksRemoteApi,
    required this.localDataSource,
  });

  Future<Either<FailureModel, AllBooksResponse>> call() async {
    try {
      AllBooksResponse response = await allBooksRemoteApi.getAllBooks();
      localDataSource.cacheAllBooks(response);
      return Right(response);
    } on ServerException catch (e) {
      return Left(
        FailureModel(
            e.errorModel.serverMessage ?? "Get all books failed From Remote"),
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
