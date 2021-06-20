import 'package:flutter/material.dart';

class AppTypography {
  static TextStyle small(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 12);
  }
}
