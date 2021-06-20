import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class DataEntity extends Equatable {
  final String message;

  DataEntity({
    @required this.message,
  });

  @override
  List<dynamic> get props => [
        message,
      ];
}
