import 'package:flutter/material.dart';
import 'package:my_links/core/services/link_service.dart';

import '../models/link_model.dart';

List<LinkModel> _links = [];

class LinksProvider with ChangeNotifier {
  final LinkService _linkService = LinkService();

  List<LinkModel> get getLinkList => _links;

  Future createLink({
    required String userId,
    required String longUrl,
    required String? shortUrl,
  }) async {
    LinkModel? linkModel = shortUrl == null
        ? await _linkService.createRandomLink(userId: userId, longUrl: longUrl)
        : await _linkService.createCustomLink(
            userId: userId, longUrl: longUrl, shortUrl: shortUrl);

    if (linkModel != null) {
      _links.insert(0, linkModel);
    }

    notifyListeners();
  }

  Future fetchAffiliatedLinks(String userId) async {
    List<LinkModel>? fetchedLinks = await _linkService.listAllLinks(userId);

    if (fetchedLinks != null) {
      _links = fetchedLinks;
    }

    notifyListeners();
  }
}
