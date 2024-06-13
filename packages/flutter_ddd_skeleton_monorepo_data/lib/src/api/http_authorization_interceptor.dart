// Package imports:
import 'package:dio/dio.dart';

class HttpAuthorizationInterceptor extends QueuedInterceptor {
  HttpAuthorizationInterceptor({
    required String apiKey,
    required String apiHost,
  })  : _apiKey = apiKey,
        _apiHost = apiHost;

  final String _apiKey;
  final String _apiHost;

  /// Called when the request is about to be sent.
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    options.headers.addAll(
      {
        'X-RapidAPI-Key': _apiKey,
        'X-RapidAPI-Host': _apiHost,
      },
    );

    handler.next(options);
  }

  /// Called when the response is about to be resolved.
  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    handler.next(response);
  }

  /// Called when an exception was occurred during the request.
  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) {
    handler.next(err);
  }
}
