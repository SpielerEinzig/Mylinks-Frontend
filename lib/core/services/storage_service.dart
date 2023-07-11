import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';

class StorageService {
  final _storage = Hive.box("storage");
  //Storage service class
  //Put list of storage keys here in the comments.

  Future storeUserAuthCredentials(Map userCredentials) async {
    await _storage.put("userCredentials", userCredentials);
  }

  Future<Map?> getUserCredentials() async {
    Map? userCredentials = await _storage.get("userCredentials");

    return userCredentials;
  }

  Future deleteUserCredentials() async {
    try {
      await _storage.delete('userCredentials');
      await _storage.clear();
    } catch (e) {
      debugPrint("Error clearing user data: $e");
    }
  }
}
