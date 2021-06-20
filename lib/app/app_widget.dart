//  app_widget.dart
import 'package:flutter/material.dart';
import 'package:flutter_clean_modular/app/core/theme/app_theme.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Clean with Modular',
      theme: AppTheme.theme,
      initialRoute: '/home/',
    ).modular();
  }
}
