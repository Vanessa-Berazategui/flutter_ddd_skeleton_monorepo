// Project imports:
import 'package:flutter_ddd_skeleton_monorepo_data/flutter_ddd_skeleton_monorepo_data.dart';

abstract class CounterRemoteDataSource extends BaseDataSource {
  Future<String> quizCounter(CounterDataParams counterDataParams);
}

class CounterDataRemoteDataSource implements CounterRemoteDataSource {
  const CounterDataRemoteDataSource({
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
