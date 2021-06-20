import 'package:dartz/dartz.dart';
import 'package:flutter_clean_modular/app/core/errors/failure.dart';
import 'package:flutter_clean_modular/app/features/home/domain/entities/data_entity.dart';

abstract class IHomeRepository {
  Future<Either<Failure, DataEntity>> getData();
}
