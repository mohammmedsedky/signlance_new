import 'package:dio/dio.dart';

import '../../data.dart';
import '../../model/request_models/login_body.dart';

class ApiService {
  ApiService._();

  static final instance = ApiService._();

  final _apiClient = ApiClient.instance.getApiClient();

  Future<Response<Map<String, dynamic>>> login(LoginBody body) => _apiClient.post(
        ServiceConst.login,
        data: body,
      );
}
