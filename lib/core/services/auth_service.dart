import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_links/core/constants/constants.dart';

class AuthService {
  Future<Map> register({
    required String email,
    required String username,
    required String password,
  }) async {
    const String endpoint = "signup";

    final response = await http.post(
      Uri.parse("$baseUrl$endpoint"),
      body: {"email": email, "password": password, "username": username},
    );

    final body = jsonDecode(response.body);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return {
        "message": "success",
        "data": {
          "email": body['user']['email'],
          "username": body['user']['username'],
          "userId": body['user']['_id'],
        },
      };
    } else {
      return {"message": body['message'], "data": null};
    }
  }

  Future login({
    required String email,
    required String password,
  }) async {
    const String endpoint = "login";

    final response = await http.post(
      Uri.parse("$baseUrl$endpoint"),
      body: {"email": email, "password": password},
    );

    final body = jsonDecode(response.body);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return {
        "message": "success",
        "data": {
          "email": body['user']['email'],
          "username": body['user']['username'],
          "userId": body['user']['_id'],
        },
      };
    } else {
      return {"message": body['message'], "data": null};
    }
  }

  Future sendForgotPasswordEmail(String email) async {}

  Future changePassword() async {}
}
