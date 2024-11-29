import 'package:dio/dio.dart';

import 'exceptions.dart';
import 'server_error_model.dart';

ServerErrorModel handleDioException(DioException e) {
  int statusCode = e.response?.statusCode ?? 0;
  String dioMessage = e.message ?? "No Dio Message";
  String serverMessage =
      e.response?.data['message'] ?? 'حدث خطأ يرجى اعادة المحاولة';

  ServerErrorModel errorModel = ServerErrorModel(
    statusCode: statusCode,
    dioMessage: dioMessage,
    serverMessage: serverMessage,
  );

  switch (e.type) {
    case DioExceptionType.connectionError:
      return ConnectionErrorException(errorModel).getErrorModel;
    case DioExceptionType.badCertificate:
      return BadCertificateException(errorModel).getErrorModel;
    case DioExceptionType.connectionTimeout:
      return ConnectionTimeoutException(errorModel).getErrorModel;
    case DioExceptionType.receiveTimeout:
      return ReceiveTimeoutException(errorModel).getErrorModel;
    case DioExceptionType.sendTimeout:
      return SendTimeoutException(errorModel).getErrorModel;
    case DioExceptionType.badResponse:
      switch (e.response?.statusCode) {
        case 400:
          return BadResponseException(errorModel).getErrorModel;
        case 401:
          return UnauthorizedException(errorModel).getErrorModel;
        case 403:
          return ForbiddenException(errorModel).getErrorModel;
        case 404:
          return NotFoundException(errorModel).getErrorModel;
        case 409:
          return CofficientException(errorModel).getErrorModel;
        default:
          return BadResponseException(errorModel).getErrorModel;
      }
    case DioExceptionType.cancel:
      return CancelException(errorModel).getErrorModel;
    case DioExceptionType.unknown:
    default:
      return UnknownException(errorModel).getErrorModel;
  }
}
