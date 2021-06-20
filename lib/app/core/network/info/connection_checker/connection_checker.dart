import 'package:flutter_clean_modular/app/core/network/info/network_info.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class ConnectionChecker implements NetworkInfo {
  InternetConnectionChecker _connectionChecker;

  ConnectionChecker() {
    _connectionChecker = InternetConnectionChecker();
  }

  @override
  Future<bool> get isConnected => _connectionChecker.hasConnection;
}
