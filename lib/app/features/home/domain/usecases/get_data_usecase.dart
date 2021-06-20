import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_clean_modular/app/core/errors/failure.dart';
import 'package:flutter_clean_modular/app/features/home/domain/entities/data_entity.dart';
import 'package:flutter_clean_modular/app/features/home/domain/repositories/home_repository.dart';

class GetDataUseCase {
  GetDataUseCase({
    @required IHomeRepository homeRepository,
  }) : _homeRepository = homeRepository;

  final IHomeRepository _homeRepository;

  Future<Either<Failure, DataEntity>> call() async {
    return await _homeRepository.getData();
  }
}
