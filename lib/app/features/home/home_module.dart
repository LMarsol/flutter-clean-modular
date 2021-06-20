// app_module.dart
import 'package:flutter_clean_modular/app/core/local_storage/storage_manager.dart';
import 'package:flutter_clean_modular/app/core/network/info/network_info.dart';
import 'package:flutter_clean_modular/app/features/home/data/datasources/home_local_datasource.dart';
import 'package:flutter_clean_modular/app/features/home/data/datasources/home_remote_datasource.dart';
import 'package:flutter_clean_modular/app/features/home/data/repositories/home_repository.dart';
import 'package:flutter_clean_modular/app/features/home/domain/repositories/home_repository.dart';
import 'package:flutter_clean_modular/app/features/home/domain/usecases/get_data_usecase.dart';
import 'package:flutter_clean_modular/app/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter_clean_modular/app/features/home/presentation/pages/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory<HomeRemoteDataSource>(
      (i) => HomeRemoteDataSource(),
    ),
    Bind.factory<HomeLocalDataSource>(
      (i) => HomeLocalDataSource(
        localStorage: i<StorageManager>(),
      ),
    ),
    Bind.factory<IHomeRepository>(
      (i) => HomeRepository(
        i<HomeLocalDataSource>(),
        i<HomeRemoteDataSource>(),
        i<NetworkInfo>(),
      ),
    ),
    Bind.factory(
      (i) => GetDataUseCase(
        homeRepository: i<IHomeRepository>(),
      ),
    ),
    Bind.lazySingleton(
      (i) => HomeCubit(
        i<GetDataUseCase>(),
      ),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => HomePage()),
  ];
}
