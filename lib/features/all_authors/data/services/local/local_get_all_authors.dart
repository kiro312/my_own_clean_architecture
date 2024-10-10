import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:my_own_clean_architecture/features/all_authors/data/data_source/local/all_authors_local_api.dart';

import '../../../../../core/network/error_handling/exceptions.dart';
import '../../../../../core/network/error_handling/failure_model.dart';
import '../../models/all_authors_response.dart';

class LocalGetAllAuthors {
  final AllAuthorsLocalApi allAuthorsLocalApi;

  LocalGetAllAuthors(this.allAuthorsLocalApi);

  Future<Either<FailureModel, AllAuthorsResponse>> call() async {
    try {
      return Right(await allAuthorsLocalApi.getLastAllAuthors());
    } on CacheException catch (e) {
      return Left(FailureModel(e.errorMessage));
    } catch (e) {
      log("LocalGetAllAuthors Error: ${e.toString()}");
      return Left(FailureModel("Get all Authors failed From Local"));
    }
  }
}
