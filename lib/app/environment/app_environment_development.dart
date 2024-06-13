// Package imports:
// Project imports:
import 'package:flutter_ddd_skeleton_monorepo/app/app.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AppEnvironment, env: [AppEnvironment.dev])
class AppEnvironmentDevelopment implements AppEnvironment {
  @override
  String get baseUrl => 'https://numbersapi.p.rapidapi.com';

  @override
  String get apiKey => '';

  @override
  String get apiHost => 'numbersapi.p.rapidapi.com';

  @override
  int get connectTimeout => 30000;

  @override
  int get receiveTimeout => 50000;

  @override
  int get sendTimeout => 30000;

  @override
  String get env => AppEnvironment.dev;
}
