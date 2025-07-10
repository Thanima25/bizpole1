import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/user_model.dart';
import '../../core/network/api_client.dart';

class AuthRemoteDataSource {
  final ApiClient client;

  AuthRemoteDataSource(this.client);

  Future<UserModel> login(String username, String password) async {
    final response = await client.post('login', {
      'username': username,
      'password': password,
    });

    if (response.statusCode == 200) {
      return UserModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<UserModel> signup(String username, String password) async {
    final response = await client.post('signup', {
      'username': username,
      'password': password,
    });

    if (response.statusCode == 200) {
      return UserModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to signup');
    }
  }
}
