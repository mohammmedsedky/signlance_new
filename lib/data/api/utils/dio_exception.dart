import 'package:dio/dio.dart';

import '../api.dart';

class DioException implements Exception {
  String? _errorMessage;

  HttpError? httpError;

  DioException.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        _errorMessage = 'Request to the server was cancelled.';
        httpError =
            HttpError(message: _errorMessage, code: ServiceConst.cancel);
        break;
      case DioErrorType.connectTimeout:
        _errorMessage = 'Connection timed out.';
        httpError = HttpError(
            message: _errorMessage, code: ServiceConst.connectTimeout);
        break;
      case DioErrorType.receiveTimeout:
        _errorMessage = 'Receiving timeout occurred.';
        httpError = HttpError(
            message: _errorMessage, code: ServiceConst.receiveTimeout);
        break;
      case DioErrorType.sendTimeout:
        _errorMessage = 'Request send timeout.';
        httpError =
            HttpError(message: _errorMessage, code: ServiceConst.sendTimeout);
        break;
      case DioErrorType.response:
        _errorMessage = handleStatusCode(dioError.response?.statusCode);
        httpError = HttpError(
            message: _errorMessage, code: dioError.response?.statusCode);
        break;
      case DioErrorType.other:
        if (dioError.message.contains('SocketException')) {
          _errorMessage = 'No Internet.';
          httpError =
              HttpError(message: _errorMessage, code: ServiceConst.noInternet);
          break;
        }
        if (dioError.response?.statusCode != null) {
          _errorMessage = handleStatusCode(dioError.response?.statusCode);
          httpError = HttpError(
              message: _errorMessage, code: dioError.error?.statusCode);
          break;
        }
        _errorMessage = 'Unexpected error occurred.';
        httpError = HttpError(message: _errorMessage);
        break;
      default:
        _errorMessage = 'Something went wrong';
        httpError = HttpError(message: _errorMessage);
        break;
    }
  }

  String handleStatusCode(int? statusCode) {
    switch (statusCode) {
      case 400:
        return 'Bad request.';
      case 401:
        return 'Authentication failed.';
      case 403:
        return 'The authenticated user is not allowed to access the specified API endpoint.';
      case 404:
        return 'The requested resource does not exist.';
      case 405:
        return 'Method not allowed. Please check the Allow header for the allowed HTTP methods.';
      case 415:
        return 'Unsupported media type. The requested content type or version number is invalid.';
      case 422:
        return 'Data validation failed.';
      case 429:
        return 'Too many requests.';
      case 204:
        return 'No Content';
      case 500:
        return 'Internal server error.';
      default:
        return 'Oops something went wrong!';
    }
  }

  @override
  String toString() => _errorMessage ?? "Unkown Error";
}
