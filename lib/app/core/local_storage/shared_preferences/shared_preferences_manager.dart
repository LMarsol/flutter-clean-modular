import 'package:flutter/foundation.dart';
import 'package:flutter_clean_modular/app/core/local_storage/storage_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager implements StorageManager {
  @override
  Future<void> saveData(String key, dynamic value) async {
    final prefs = await SharedPreferences.getInstance();
    if (value is int) {
      prefs.setInt(key, value);
    } else if (value is String) {
      prefs.setString(key, value);
    } else if (value is bool) {
      prefs.setBool(key, value);
    } else {
      debugPrint("Invalid Type");
    }
  }

  @override
  Future<dynamic> readData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    dynamic obj = prefs.get(key);
    return obj;
  }

  @override
  Future<bool> deleteData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }
}
