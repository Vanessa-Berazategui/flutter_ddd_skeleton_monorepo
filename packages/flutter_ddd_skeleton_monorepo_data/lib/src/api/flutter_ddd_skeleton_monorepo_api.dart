// Dart imports:
import 'dart:developer';

// Package imports:
import 'package:dio/dio.dart';
// Flutter imports:
import 'package:flutter/foundation.dart';
// Project imports:
import 'package:flutter_ddd_skeleton_monorepo_data/src/flutter_ddd_skeleton_monorepo_data.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';

part 'flutter_ddd_skeleton_monorepo_api.g.dart';

@RestApi()
abstract class FlutterDddSkeletonMonorepoApi {
  factory FlutterDddSkeletonMonorepoApi({
    required String baseUrl,
    required HttpAuthorizationInterceptor httpAuthorizationInterceptor,
    required TimeoutOptions timeoutOptions,
    Dio? dio,
  }) {
    return _FlutterDddSkeletonMonorepoApi(
      dio ??
          getDio(
            baseUrl: baseUrl,
            httpAuthorizationInterceptor: httpAuthorizationInterceptor,
            timeoutOptions: timeoutOptions,
          ),
      baseUrl: baseUrl,
    );
  }

  static Dio? __dio;

  static Dio? get dio => __dio;

  static Dio getDio({
    required String baseUrl,
    required HttpAuthorizationInterceptor httpAuthorizationInterceptor,
    required TimeoutOptions timeoutOptions,
    bool debugMode = false,
  }) {
    if (dio != null) {
      return dio!;
    }

    __dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        contentType: 'application/json',
        connectTimeout: timeoutOptions.connectTimeout,
        receiveTimeout: timeoutOptions.receiveTimeout,
        sendTimeout: timeoutOptions.sendTimeout,
      ),
    );

    dio!.interceptors.add(httpAuthorizationInterceptor);

    if (debugMode || kDebugMode) {
      dio!.interceptors.add(
        PrettyDioLogger(
          responseHeader: true,
          requestHeader: true,
          requestBody: true,
          logPrint: (o) => log(o.toString()),
        ),
      );
    }

    return dio!;
  }

  /// Counter endpoints
  @GET(Endpoint.quizCounter)
  Future<CounterResponse> quizCounter({
    @Path('number') required int number,
    @Query('fragment') required bool fragment,
    @Query('json') required bool json,
  });
}
