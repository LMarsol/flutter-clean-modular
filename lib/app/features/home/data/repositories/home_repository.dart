import 'package:dartz/dartz.dart';
import 'package:flutter_clean_modular/app/core/errors/failure.dart';
import 'package:flutter_clean_modular/app/core/network/info/network_info.dart';
import 'package:flutter_clean_modular/app/features/home/data/datasources/home_local_datasource.dart';
import 'package:flutter_clean_modular/app/features/home/data/datasources/home_remote_datasource.dart';
import 'package:flutter_clean_modular/app/features/home/data/models/data_model.dart';
import 'package:flutter_clean_modular/app/features/home/domain/entities/data_entity.dart';
import 'package:flutter_clean_modular/app/features/home/domain/repositories/home_repository.dart';

class HomeRepository extends IHomeRepository {
  HomeRepository(
    this._localDataSource,
    this._remoteDataSource,
    this._networkInfo,
  );

  final HomeLocalDataSource _localDataSource;
  final HomeRemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  @override
  Future<Either<Failure, DataEntity>> getData() async {
    bool isConnected = await _networkInfo.isConnected;

    if (isConnected) {
      return await _getDataFromRemoteSource();
    } else {
      return await _getDataFromLocalSource();
    }
  }

  Future<Either<Failure, DataEntity>> _getDataFromRemoteSource() async {
    try {
      return Right(
        DataModel.fromMap(
          await _remoteDataSource.getData(),
        ),
      );
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, DataEntity>> _getDataFromLocalSource() async {
    try {
      return Right(
        DataModel.fromMap(
          await _localDataSource.getData(),
        ),
      );
    } catch (e) {
      return Left(LocalFailure());
    }
  }
}
