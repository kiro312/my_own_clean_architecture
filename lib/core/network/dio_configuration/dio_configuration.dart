import 'package:dio/dio.dart';
import 'package:my_own_clean_architecture/core/dependency_injection/main_injection.dart';
import 'package:my_own_clean_architecture/core/helpers/cache_helper.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioConfiguration {
  /// private constructor
  DioConfiguration._();

  static Dio? dio;

  static Dio getDio({required String dioBaseUrl}) {
    Duration timeOut = const Duration(seconds: 20);

    if (dio == null) {
      dio = Dio();
      dio!.options.baseUrl = dioBaseUrl;
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;

      addDioInterceptors(); // Add interceptors only once
    }
    return dio!;
  }

  // No need to add headers manually here, use interceptor instead
  static void addDioInterceptors() {
    dio?.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          String token = await getToken(); // Fetch token dynamically

          // Add token to headers dynamically before request
          options.headers = {
            ...options.headers,
            'Content-Type': 'application/json',
            if (token.isNotEmpty) 'Authorization': 'Bearer $token',
          };

          return handler.next(options); // Continue with the request
        },
      ),
    );

    // Logging interceptor for debugging
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
        responseBody: true,
        error: true,
      ),
    );
  }

  static Future<String> getToken() async {
    String token = '';
    token = await getIt<CacheHelper>().getToken();
    return token;
  }
}
