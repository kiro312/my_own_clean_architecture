import 'package:get_it/get_it.dart';
import 'package:my_own_clean_architecture/features/all_authors/data/services/remote/remote_get_all_authors.dart';

import '../../features/all_authors/data/data_source/local/all_authors_local_api.dart';
import '../../features/all_authors/data/data_source/remote/all_authors_remote_api.dart';
import '../../features/all_authors/data/repository/all_authors_repository.dart';
import '../../features/all_authors/data/services/local/local_get_all_authors.dart';
import '../helpers/cache_helper.dart';

Future<void> registerAllAuthorsDependencies(GetIt getIt) async {
  //  AllAuthorsLocalApi depends on dio
  getIt.registerLazySingleton<AllAuthorsRemoteApi>(
    () => AllAuthorsRemoteApi(getIt()),
  );

  // AllAuthorsLocalApi depends on CacheHelper
  getIt.registerLazySingleton<AllAuthorsLocalApi>(
    () => AllAuthorsLocalApi(getIt<CacheHelper>()),
  );

  getIt.registerLazySingleton<RemoteGetAllAuthors>(
    () => RemoteGetAllAuthors(
      getIt<AllAuthorsRemoteApi>(),
      getIt<AllAuthorsLocalApi>(),
    ),
  );

  // LocalGetAllAuthors depends on AllBooksLocalApi
  getIt.registerLazySingleton<LocalGetAllAuthors>(
    () => LocalGetAllAuthors(getIt<AllAuthorsLocalApi>()),
  );

  // AllAuthorsRepository depends on NetworkInfo, LocalGetAllAuthors, RemoteGetAllAuthors
  getIt.registerLazySingleton<AllAuthorsRepository>(
    () => AllAuthorsRepository(
      networkInfo: getIt(),
      // (local, remote) get services
      localGetAllAuthors: getIt(),
      remoteGetAllAuthors: getIt(),
    ),
  );
}
