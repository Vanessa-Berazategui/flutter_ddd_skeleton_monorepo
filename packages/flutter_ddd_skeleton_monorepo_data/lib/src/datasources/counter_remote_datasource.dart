// Project imports:
import 'package:flutter_ddd_skeleton_monorepo_data/flutter_ddd_skeleton_monorepo_data.dart';
import 'package:flutter_ddd_skeleton_monorepo_data/src/api/params/counter_data_params.dart';

class CounterRemoteDataSource extends BaseDataSource {
  const CounterRemoteDataSource({
    required this.api,
  });

  final FlutterDddSkeletonMonorepoApi api;

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
