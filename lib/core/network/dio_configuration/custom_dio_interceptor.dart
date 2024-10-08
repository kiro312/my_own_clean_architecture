import 'package:dio/dio.dart';

import '../error_handling/dio_exception_handler.dart';

class CustomDioInterceptor extends InterceptorsWrapper {
  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    try {
      // Handle the Dio error
      handleDioException(err);
    } catch (e) {
      // If a custom exception is thrown, you can pass it through the handler
      return handler.reject(
        DioException(
          requestOptions: err.requestOptions,
          error: e,
          response: err.response,
          type: err.type,
          stackTrace: err.stackTrace,
          message: err.message,
        ),
      );
    }
    return super.onError(err, handler);
  }
}
