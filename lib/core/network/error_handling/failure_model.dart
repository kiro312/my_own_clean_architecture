import 'package:dio/dio.dart';
import 'package:my_own_clean_architecture/core/network/error_handling/dio_exception_handler.dart';

/// This class is used to handle UI error messages.
/// [message] is the error message that displayed to the user screen.
class FailureModel {
  final String message;

  FailureModel(this.message);

  @override
  String toString() => 'FailureModel(message: $message)';

  factory FailureModel.handleErrors({
    required dynamic error,
    required String defaultMessage,
  }) {
    if (error is DioException) {
      final errorModel = handleDioException(error);
      return FailureModel(errorModel.serverMessage ?? defaultMessage);
    } else {
      return FailureModel(defaultMessage);
    }
  }

  factory FailureModel.getDefaultFailure() {
    return FailureModel('An error occurred');
  }

  factory FailureModel.getNoInternetFailure() {
    return FailureModel('No internet connection');
  }
}
