import 'package:dio/dio.dart';

import '../../repository/app_session.dart';

class AuthorizationInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    //String? accessToken = await SharedPrefsManager.instance.getAccessToken();
    options.headers['lang'] = AppSession.getLangKey();
    if (_needAuthorizationHeader(options)) {
      // adds the access-token with the header
      options.headers['Authorization'] = 'Bearer ${AppSession.currentUser?.accessToken}';
    }
    // continue with the request
    super.onRequest(options, handler);
  }

  bool _needAuthorizationHeader(RequestOptions options) {
    if (options.method == 'GET') {
      return false;
    } else {
      return true;
    }
  }
}
