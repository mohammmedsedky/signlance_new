import 'package:dio/dio.dart';
import '../../../utils/logger.dart';
import '../api.dart';

class LoggerInterceptor extends Interceptor {
  LoggerInterceptor._();

  static final instance = LoggerInterceptor._();

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    final options = err.requestOptions;
    final requestPath = '${options.baseUrl}${options.path}';
    logger.e('endpoint => $requestPath\nError: ${err.error}\ntype: ${err.type}'); // Error log
    return super.onError(err, handler);
  }

  // @override
  // void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
  //   //final requestPath = '${options.baseUrl}${options.path}';
  //   //final object = json.decode(options.data);
  //   //final prettyString = const JsonEncoder.withIndent('  ').convert(options.data);
  //   //logger.i('${options.method}:$requestPath\nbody:$prettyString}'); // Info log
  //   return super.onRequest(options, handler);
  // }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    //final prettyString = const JsonEncoder.withIndent('  ').convert(response.data);
    //logger.i('StatusCode: ${response.statusCode}, StatusMessage: ${response.statusMessage}\nbody:$prettyString');
    if (response.statusCode != 200 && response.statusCode != 201) {
      throw DioError(
          type: DioErrorType.response,
          error: HttpError(code: response.statusCode, message: response.statusMessage),
          requestOptions: response.requestOptions,
          response: Response(requestOptions: response.requestOptions, statusCode: response.statusCode, statusMessage: response.statusMessage));
    }
    return super.onResponse(response, handler);
  }
}
