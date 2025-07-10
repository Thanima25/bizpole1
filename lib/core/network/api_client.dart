import 'package:http/http.dart' as http;

class ApiClient {
  static const String baseUrl = 'https://your-api-domain.com/api';

  Future<http.Response> post(String endpoint, Map<String, dynamic> body) {
    final url = Uri.parse('$baseUrl/$endpoint');
    return http.post(url, body: body);
  }
}
