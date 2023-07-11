import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_links/core/constants/constants.dart';
import 'package:my_links/core/models/link_model.dart';

class LinkService {
  Future<LinkModel?> createRandomLink({
    required String userId,
    required String longUrl,
  }) async {
    String endpoint = "url/generate/random";

    final response = await http.post(Uri.parse("$baseUrl$endpoint"),
        body: {"userId": userId, "longURL": longUrl});

    final body = jsonDecode(response.body);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return LinkModel.fromJson(body);
    } else {
      return null;
    }
  }

  Future createCustomLink({
    required String userId,
    required String longUrl,
    required String shortUrl,
  }) async {
    String endpoint = "url/generate/custom";

    final response = await http.post(Uri.parse("$baseUrl$endpoint"),
        body: {"userId": userId, "longURL": longUrl, "shortURL": shortUrl});

    final body = jsonDecode(response.body);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return LinkModel.fromJson(body);
    } else {
      return null;
    }
  }

  Future<List<LinkModel>?> listAllLinks(String userId) async {
    String endpoint = "url/all/$userId";

    final response = await http.get(Uri.parse("$baseUrl$endpoint"));

    final body = jsonDecode(response.body);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      List<LinkModel> links = body['urls']
          .map<LinkModel>((data) => LinkModel.fromJson(data))
          .toList();

      return links;
    } else {
      return null;
    }
  }
}
