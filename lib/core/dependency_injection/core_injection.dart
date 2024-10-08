import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:my_own_clean_architecture/core/helpers/cache_helper.dart';
import 'package:my_own_clean_architecture/core/network/dio_configuration/dio_configuration.dart';
import 'package:my_own_clean_architecture/core/network/network_info/network_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

void registerCoreDependencies(GetIt getIt) {
  // Dio
  getIt.registerLazySingleton<Dio>(() => DioConfiguration.getDio());

  // DataConnectionChecker
  getIt.registerLazySingleton<DataConnectionChecker>(
      () => DataConnectionChecker());
  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfo(getIt()));

  // SharedPreferences
  getIt.registerLazySingletonAsync<SharedPreferences>(
    () async => await SharedPreferences.getInstance(),
  );

  // CacheHelper
  getIt.registerLazySingleton<CacheHelper>(() => CacheHelper(getIt()));
}
