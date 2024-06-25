// Package imports:
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_ddd_skeleton_monorepo/app/app.dart';
import 'package:flutter_ddd_skeleton_monorepo/counter/counter.dart';
import 'package:flutter_ddd_skeleton_monorepo_data/flutter_ddd_skeleton_monorepo_data.dart';
import 'package:flutter_ddd_skeleton_monorepo_domain/flutter_ddd_skeleton_monorepo_domain.dart';
// Project imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/helpers.dart';

class CounterMockLocalDataSource extends Mock
    implements CounterLocalDataSource {
  static int? counter;

  @override
  Future<int> getCounter() async {
    if (counter == null) return 0;

    return counter!;
  }

  @override
  Future<void> saveCounter(CounterDataParams counterDataParams) async {
    counter = counterDataParams.value;
  }
}

class CounterMockRemoteDataSource extends Mock
    implements CounterRemoteDataSource {
  CounterMockRemoteDataSource({
    required this.api,
  });

  final FlutterDddSkeletonMonorepoApi api;

  @override
  Future<String> quizCounter(CounterDataParams counterDataParams) async {
    final result = await api.quizCounter(
      number: counterDataParams.value,
      fragment: true,
      json: true,
    );

    if (result.found) {
      return result.text;
    }

    throw QuizException();
  }
}

void main() {
  /// DataSources
  late CounterLocalDataSource counterLocalDataSource;
  late CounterRemoteDataSource counterRemoteDataSource;

  /// Repositories
  late CounterRepository counterRepository;

  /// UseCases
  late SaveCounterUseCase saveCounterUseCase;
  late GetCounterUseCase getCounterUseCase;
  late QuizCounterUseCase quizCounterUseCase;

  /// Environment
  late AppEnvironment env;

  /// Api
  late FlutterDddSkeletonMonorepoApi api;

  setUpAll(() {
    env = const AppEnvironmentTesting();

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

    counterLocalDataSource = CounterMockLocalDataSource();
    counterRemoteDataSource = CounterMockRemoteDataSource(api: api);

    counterRepository = CounterDataRepository(
      localDataSource: counterLocalDataSource,
      remoteDataSource: counterRemoteDataSource,
    );

    saveCounterUseCase = SaveCounterUseCase(repository: counterRepository);
    getCounterUseCase = GetCounterUseCase(repository: counterRepository);
    quizCounterUseCase = QuizCounterUseCase(repository: counterRepository);
  });

  group('CounterBloc', () {
    blocTest<CounterBloc, CounterState>(
      'emits [0] when is the initial state',
      build: () => CounterBloc(
        saveCounterUseCase: saveCounterUseCase,
        getCounterUseCase: getCounterUseCase,
        quizCounterUseCase: quizCounterUseCase,
      ),
      verify: (bloc) => bloc.state.value == 0,
    );

    blocTest<CounterBloc, CounterState>(
      'emits [1] when increment is called',
      build: () => CounterBloc(
        saveCounterUseCase: saveCounterUseCase,
        getCounterUseCase: getCounterUseCase,
        quizCounterUseCase: quizCounterUseCase,
      ),
      act: (bloc) => bloc.increment(),
      verify: (bloc) => bloc.state.value == 1,
    );

    blocTest<CounterBloc, CounterState>(
      'emits [-1] when decrement is called',
      build: () => CounterBloc(
        saveCounterUseCase: saveCounterUseCase,
        getCounterUseCase: getCounterUseCase,
        quizCounterUseCase: quizCounterUseCase,
      ),
      act: (bloc) => bloc.decrement(),
      verify: (bloc) => bloc.state.value == -1,
    );

    blocTest<CounterBloc, CounterState>(
      'emits [quiz] when quiz is get.',
      build: () => CounterBloc(
        saveCounterUseCase: saveCounterUseCase,
        getCounterUseCase: getCounterUseCase,
        quizCounterUseCase: quizCounterUseCase,
      ),
      act: (bloc) async {
        bloc.increment();
        await bloc.quiz();
      },
      verify: (bloc) => bloc.state.quiz.isNotEmpty,
    );
  });
}
