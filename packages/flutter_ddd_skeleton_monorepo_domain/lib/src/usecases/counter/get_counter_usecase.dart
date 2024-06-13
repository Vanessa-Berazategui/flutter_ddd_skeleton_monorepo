// Project imports:
import 'package:flutter_ddd_skeleton_monorepo_domain/src/params/params.dart';
import 'package:flutter_ddd_skeleton_monorepo_domain/src/repositories/counter_repository.dart';
import 'package:flutter_ddd_skeleton_monorepo_domain/src/result/result.dart';
import 'package:flutter_ddd_skeleton_monorepo_domain/src/usecases/usecases.dart';

class GetCounterUseCase implements BaseUseCase<int, NoParams> {
  const GetCounterUseCase({required CounterRepository repository})
      : _repository = repository;

  final CounterRepository _repository;

  @override
  Future<Result<int>> call(NoParams params) => _repository.getCounter(params);
}
