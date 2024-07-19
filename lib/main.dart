import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/presentation/app.dart';

import 'core/di/di_configuration.dart';

void main() {
  configureDependencies(Environment.prod);
  runApp(const App());
}