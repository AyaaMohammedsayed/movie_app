import 'dart:convert';

import 'package:movie_app/core/constants/constant_api.dart';
import 'package:movie_app/core/models/login_response.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/core/models/register_response/register_response.dart';

class ApiService {
  static Future<LoginResponse> login({
    required String email,
    required String password,
  }) async {
    Uri uri = Uri.https(ConstantApi.baseURL, ConstantApi.loginEndPoint);
    http.Response response = await http.post(
      uri,
      headers: {
        "ContentType": "application/json",
        "apiKey": ConstantApi.apiKey,
      },
      body: jsonEncode({"email": email, "password": password}),
    );
    Map<String, dynamic> json = jsonDecode(response.body);
    return LoginResponse.fromJson(json);
  }

  static Future<RegisterResponse> register({
    required String name,
    required String email,
    required String password,
    required String phone,
    required int avatatId,
  }) async {
    Uri uri = Uri.https(ConstantApi.baseURL, ConstantApi.registerEndPoint);
    http.Response response = await http.post(
      uri,
      headers: {
        "Content-Type": "application/json",
        "apiKey": ConstantApi.apiKey,
      },
      body: jsonEncode({
        "name": name,
        "email": email,
        "password": password,
        "phone": phone,
        "avaterId": avatatId,
      }),
    );
    Map<String, dynamic> json = jsonDecode(response.body);
    return RegisterResponse.fromJson(json);
  }
}
