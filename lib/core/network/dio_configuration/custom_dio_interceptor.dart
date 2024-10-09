import 'package:dio/dio.dart';
import '../error_handling/dio_exception_handler.dart';

class CustomDioInterceptor extends InterceptorsWrapper {
  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    try {
      // Handle the Dio error and ensure it returns the handled exception
      final handledException = handleDioException(err);

      // If the function returns an exception or message, pass it to reject
      return handler.reject(
        DioException(
          requestOptions: err.requestOptions,
          error: handledException, // Pass the handled exception or message here
          response: err.response,
          type: err.type,
          stackTrace: err.stackTrace,
          message: err.message,
        ),
      );
    } catch (e) {
      // If a custom exception is thrown, pass it through the handler
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
  }
}
