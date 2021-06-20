import 'package:flutter/foundation.dart';
import 'package:flutter_clean_modular/app/features/home/domain/entities/data_entity.dart';

class DataModel extends DataEntity {
  DataModel({
    @required String message,
  }) : super(
          message: message,
        );

  factory DataModel.fromMap(Map<String, dynamic> map) {
    return DataModel(
      message: map['message'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'message': message,
    };
  }
}
