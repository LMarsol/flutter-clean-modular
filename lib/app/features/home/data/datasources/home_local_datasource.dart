import 'package:flutter/foundation.dart';
import 'package:flutter_clean_modular/app/core/local_storage/storage_manager.dart';

class HomeLocalDataSource {
  HomeLocalDataSource({
    @required StorageManager localStorage,
  }) : _localStorage = localStorage;

  final StorageManager _localStorage;

  Future<Map<String, dynamic>> getData() async {
    //retrieve data from local storage
    return Future.value({'message': 'Loaded data from local storage'});
  }
}
