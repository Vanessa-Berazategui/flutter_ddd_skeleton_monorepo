// Package imports:

// Project imports:
import 'package:flutter_ddd_skeleton_monorepo/app/app.dart';
// Package imports:

class AppEnvironmentTesting implements AppEnvironment {
  const AppEnvironmentTesting();

  @override
  String get baseUrl => 'https://numbersapi.p.rapidapi.com';

  @override
  String get apiKey => '3954d4f3abmsh5ca86014f157f79p1f5bd4jsn90e988834ad6';

  @override
  String get apiHost => 'numbersapi.p.rapidapi.com';

  @override
  int get connectTimeout => 30000;

  @override
  int get receiveTimeout => 50000;

  @override
  int get sendTimeout => 30000;

  @override
  String get env => AppEnvironment.test;
}
