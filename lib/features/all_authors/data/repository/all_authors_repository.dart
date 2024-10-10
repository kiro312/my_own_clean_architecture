import 'package:dartz/dartz.dart';

import '../../../../core/network/error_handling/failure_model.dart';
import '../../../../core/network/network_info/network_info.dart';
import '../models/all_authors_response.dart';
import '../services/local/local_get_all_authors.dart';
import '../services/remote/remote_get_all_authors.dart';

class AllAuthorsRepository {
  final NetworkInfo networkInfo;

  // (local, remote) get services
  final LocalGetAllAuthors localGetAllAuthors;
  final RemoteGetAllAuthors remoteGetAllAuthors;

  AllAuthorsRepository({
    required this.networkInfo,
    required this.localGetAllAuthors,
    required this.remoteGetAllAuthors,
  });

  // get all authors
  Future<Either<FailureModel, AllAuthorsResponse>> getAllAuthors() async {
    if (await networkInfo.isConnected) {
      return await remoteGetAllAuthors.call();
    } else {
      return await localGetAllAuthors.call();
    }
  }
}
