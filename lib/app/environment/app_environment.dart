abstract class AppEnvironment {
  AppEnvironment({
    required this.baseUrl,
    required this.apiKey,
    required this.apiHost,
    required this.connectTimeout,
    required this.sendTimeout,
    required this.receiveTimeout,
    required this.env,
  });

  final String baseUrl;
  final int connectTimeout;
  final int sendTimeout;
  final int receiveTimeout;
  final String apiKey;
  final String apiHost;
  final String env;

  static const dev = 'dev';
  static const stg = 'stg';
  static const prod = 'prod';
  static const test = 'test';
}
