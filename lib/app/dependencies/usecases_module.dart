// Package imports:
import 'package:flutter_ddd_skeleton_monorepo_domain/flutter_ddd_skeleton_monorepo_domain.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppUseCasesModule {
  //============================
  // Counter
  //============================
  @lazySingleton
  GetCounterUseCase getCounterUseCase(
    CounterRepository repository,
  ) =>
      GetCounterUseCase(repository: repository);

  @lazySingleton
  SaveCounterUseCase saveCounterUseCase(
    CounterRepository repository,
  ) =>
      SaveCounterUseCase(repository: repository);

  @lazySingleton
  QuizCounterUseCase quizCounterUseCase(
    CounterRepository repository,
  ) =>
      QuizCounterUseCase(repository: repository);
}
