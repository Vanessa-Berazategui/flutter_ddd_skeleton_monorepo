// Package imports:
import 'dart:developer';

import 'package:flutter_ddd_skeleton_monorepo_data/flutter_ddd_skeleton_monorepo_data.dart';
// Project imports:
import 'package:flutter_test/flutter_test.dart';

class AppEnvironmentApi {
  const AppEnvironmentApi();

  String get baseUrl => 'https://numbersapi.p.rapidapi.com';

  String get apiKey => '3954d4f3abmsh5ca86014f157f79p1f5bd4jsn90e988834ad6';

  String get apiHost => 'numbersapi.p.rapidapi.com';

  int get connectTimeout => 30000;

  int get receiveTimeout => 50000;

  int get sendTimeout => 30000;

  String get env => 'api';
}

void main() {
  /// Api
  late FlutterDddSkeletonMonorepoApi api;
  late AppEnvironmentApi env;

  setUpAll(() {
    env = const AppEnvironmentApi();

    api = FlutterDddSkeletonMonorepoApi(
      baseUrl: env.baseUrl,
      httpAuthorizationInterceptor: HttpAuthorizationInterceptor(
        apiKey: env.apiKey,
        apiHost: env.apiHost,
      ),
      timeoutOptions: TimeoutOptions(
        connectTimeout: env.connectTimeout,
        sendTimeout: env.sendTimeout,
        receiveTimeout: env.receiveTimeout,
      ),
    );
  });

  group('numbersapi', () {
    test('quizCounter', () async {
      final result = await api.quizCounter(
        number: 16,
        fragment: true,
        json: true,
      );

      log(result.text);

      expect(result.text, isNotEmpty, reason: 'Quiz result is empty');
    });
  });
}
