class AppEnvironmentApi {
  const AppEnvironmentApi();

  String get baseUrl => 'https://numbersapi.p.rapidapi.com';

  String get apiKey => '';

  String get apiHost => 'numbersapi.p.rapidapi.com';

  int get connectTimeout => 30000;

  int get receiveTimeout => 50000;

  int get sendTimeout => 30000;

  String get env => 'api';
}
