import 'package:get_it/get_it.dart';
import 'package:my_own_clean_architecture/core/helpers/cache_helper.dart';
import 'package:my_own_clean_architecture/core/network/network_info/network_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/all_books/data/data_source/local/all_books_local_api.dart';
import '../../features/all_books/data/data_source/remote/all_books_remote_api.dart';
import '../../features/all_books/data/repository/all_books_repository.dart';
import '../../features/all_books/data/services/local/local_get_all_books.dart';
import '../../features/all_books/data/services/remote/remote_get_all_books.dart';

Future<void> registerAllBooksDependencies(GetIt getIt) async {
  // Wait for SharedPreferences to be initialized
  await getIt.isReady<SharedPreferences>();

  // AllBooksRemoteApi
  getIt.registerLazySingleton<AllBooksRemoteApi>(
    () => AllBooksRemoteApi(getIt()),
  );

  // AllBooksLocalApi depends on CacheHelper
  getIt.registerSingleton<AllBooksLocalApi>(
    AllBooksLocalApi(getIt<CacheHelper>()),
  );

  // RemoteGetAllBooks depends on AllBooksRemoteApi and AllBooksLocalApi
  getIt.registerLazySingleton<RemoteGetAllBooks>(
    () => RemoteGetAllBooks(
      allBooksRemoteApi: getIt<AllBooksRemoteApi>(),
      localDataSource: getIt<AllBooksLocalApi>(),
    ),
  );

  // LocalGetAllBooks depends on AllBooksLocalApi
  getIt.registerLazySingleton<LocalGetAllBooks>(
    () => LocalGetAllBooks(localDataSource: getIt<AllBooksLocalApi>()),
  );

  // AllBooksRepository depends on LocalGetAllBooks, NetworkInfo, and RemoteGetAllBooks
  getIt.registerSingleton<AllBooksRepository>(
    AllBooksRepository(
      localGetAllBooks: getIt<LocalGetAllBooks>(),
      networkInfo: getIt<NetworkInfo>(),
      remoteGetAllBooks: getIt<RemoteGetAllBooks>(),
    ),
  );
  // log('AllBooks dependencies are registered');
}
