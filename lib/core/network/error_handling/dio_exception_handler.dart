import 'package:dio/dio.dart';
import 'error_model.dart';
import 'exceptions.dart';

void handleDioException(DioException e) {
  String? dioMessage = e.message; // Get the Dio error message
  ErrorModel errorModel;

  if (e.response != null) {
    errorModel = ErrorModel.fromJson(e.response!.data, dioMessage: dioMessage);
  } else {
    errorModel = ErrorModel(dioMessage: dioMessage);
  }

  switch (e.type) {
    case DioExceptionType.connectionError:
      throw ConnectionErrorException(errorModel);
    case DioExceptionType.badCertificate:
      throw BadCertificateException(errorModel);
    case DioExceptionType.connectionTimeout:
      throw ConnectionTimeoutException(errorModel);
    case DioExceptionType.receiveTimeout:
      throw ReceiveTimeoutException(errorModel);
    case DioExceptionType.sendTimeout:
      throw SendTimeoutException(errorModel);
    case DioExceptionType.badResponse:
      switch (e.response?.statusCode) {
        case 400:
          throw BadResponseException(errorModel);
        case 401:
          throw UnauthorizedException(errorModel);
        case 403:
          throw ForbiddenException(errorModel);
        case 404:
          throw NotFoundException(errorModel);
        case 409:
          throw CofficientException(errorModel);
        default:
          throw BadResponseException(errorModel);
      }
    case DioExceptionType.cancel:
      throw CancelException(errorModel);
    case DioExceptionType.unknown:
      throw UnknownException(errorModel);
    default:
      throw UnknownException(errorModel);
  }
}
