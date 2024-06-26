// Package imports:
import 'dart:developer';

import 'package:flutter_ddd_skeleton_monorepo_data/flutter_ddd_skeleton_monorepo_data.dart';
// Project imports:
import 'package:flutter_test/flutter_test.dart';

import '../helpers/helpers.dart';

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
