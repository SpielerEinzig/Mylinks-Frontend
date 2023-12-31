import 'package:flutter/material.dart';
import 'package:my_links/core/services/auth_service.dart';
import 'package:my_links/core/services/storage_service.dart';

Map? _userDetails;

class UserProvider with ChangeNotifier {
  final AuthService _authService = AuthService();
  final StorageService _storageService = StorageService();

  Map? get getUserDetails => _userDetails;

  storeUserCredentials(Map credentials) {
    _userDetails = credentials;
    notifyListeners();
  }

  Future<String> login({
    required String email,
    required String password,
  }) async {
    Map fetchedDetails =
        await _authService.login(email: email, password: password);

    _userDetails = fetchedDetails['data'];

    if (fetchedDetails['data'] != null) {
      _storageService.storeUserAuthCredentials(fetchedDetails['data']);
    }

    notifyListeners();

    return fetchedDetails['message'];
  }

  Future<String> signUp({
    required String email,
    required String password,
    required String username,
  }) async {
    Map fetchedDetails = await _authService.register(
        email: email, password: password, username: username);

    _userDetails = fetchedDetails['data'];

    if (fetchedDetails['data'] != null) {
      _storageService.storeUserAuthCredentials(fetchedDetails['data']);
    }

    notifyListeners();

    return fetchedDetails['message'];
  }
}
