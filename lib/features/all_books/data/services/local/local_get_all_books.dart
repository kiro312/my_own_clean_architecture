import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:my_own_clean_architecture/core/network/error_handling/exceptions.dart';
import 'package:my_own_clean_architecture/core/network/error_handling/failure_model.dart';
import 'package:my_own_clean_architecture/features/all_books/data/models/all_books_response.dart';

import '../../data_source/local/all_books_local_api.dart';

class LocalGetAllBooks {
  final AllBooksLocalApi localDataSource;

  LocalGetAllBooks({
    required this.localDataSource,
  });
  Future<Either<FailureModel, AllBooksResponse>> call() async {
    try {
      return Right(await localDataSource.getLastAllBooks());
    } on CacheException catch (e) {
      return Left(FailureModel(e.errorMessage));
    } catch (e) {
      log("LocalGetAllBooks Error: ${e.toString()}");
      return Left(FailureModel("Get all books failed From Local"));
    }
  }
}
