// app_module.dart
import 'package:flutter_clean_modular/app/core/local_storage/shared_preferences/shared_preferences_manager.dart';
import 'package:flutter_clean_modular/app/core/local_storage/storage_manager.dart';
import 'package:flutter_clean_modular/app/core/network/info/connection_checker/connection_checker.dart';
import 'package:flutter_clean_modular/app/core/network/info/network_info.dart';
import 'package:flutter_clean_modular/app/features/home/home_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton<NetworkInfo>((i) => ConnectionChecker()),
    Bind.singleton<StorageManager>((i) => SharedPreferencesManager()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/home', module: HomeModule()),
  ];
}
