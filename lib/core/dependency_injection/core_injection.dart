import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:my_own_clean_architecture/core/helpers/cache_helper.dart';
import 'package:my_own_clean_architecture/core/network/dio_configuration/dio_configuration.dart';
import 'package:my_own_clean_architecture/core/network/network_info/network_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> registerCoreDependencies(GetIt getIt) async {
  // Dio
  getIt.registerSingleton<Dio>(DioConfiguration.getDio());

  // DataConnectionChecker
  getIt.registerSingleton<DataConnectionChecker>(
    DataConnectionChecker(),
  );

  // NetworkInfo depends on DataConnectionChecker
  getIt.registerSingleton<NetworkInfo>(
    NetworkInfo(getIt<DataConnectionChecker>()),
  );

  // SharedPreferences registered asynchronously
  getIt.registerSingletonAsync<SharedPreferences>(
    () async => await SharedPreferences.getInstance(),
  );

  await getIt.isReady<SharedPreferences>(); // Ensure SharedPreferences is ready

  // CacheHelper depends on SharedPreferences
  getIt.registerSingleton<CacheHelper>(
    CacheHelper(getIt<SharedPreferences>()),
  );
}
