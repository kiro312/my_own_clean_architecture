import 'package:dartz/dartz.dart';
import 'package:my_own_clean_architecture/core/network/error_handling/failure_model.dart';
import 'package:my_own_clean_architecture/features/all_books/data/models/all_books_response.dart';

import '../../../../core/network/network_info/network_info.dart';
import '../services/local/local_get_all_books.dart';
import '../services/remote/remote_get_all_books.dart';

class AllBooksRepository {
  final NetworkInfo networkInfo;
  final LocalGetAllBooks localGetAllBooks;
  final RemoteGetAllBooks remoteGetAllBooks;

  AllBooksRepository({
    required this.networkInfo,
    required this.localGetAllBooks,
    required this.remoteGetAllBooks,
  });

  Future<Either<FailureModel, AllBooksResponse>> getAllBooks() async {
    if (await networkInfo.isConnected) {
      return await remoteGetAllBooks.call();
    } else {
      return await localGetAllBooks.call();
    }
  }
}
