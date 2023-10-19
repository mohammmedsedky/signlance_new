import '../api/api.dart';
import '../model/request_models/login_body.dart';

class Repository {
  Repository._();

  static final instance = Repository._();

  final ApiService _apiService = ApiService.instance;

  Future<Map<String, dynamic>?> login(LoginBody body) async {
    final response = await _apiService.login(body);
    return response.data;
  }
}
