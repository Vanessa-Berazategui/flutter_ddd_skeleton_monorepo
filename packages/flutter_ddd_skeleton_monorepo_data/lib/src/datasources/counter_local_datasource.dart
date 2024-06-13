// Package imports:
// Project imports:

import 'package:flutter_ddd_skeleton_monorepo_data/flutter_ddd_skeleton_monorepo_data.dart';
import 'package:flutter_ddd_skeleton_monorepo_data/src/api/params/counter_data_params.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CounterLocalDataSource extends BaseDataSource {
  const CounterLocalDataSource({
    required FlutterSecureStorage storage,
  }) : _storage = storage;

  final FlutterSecureStorage _storage;

  static const _cachedCounter = 'CACHED_COUNTER';

  Future<int> getCounter() async {
    final jsonStr = await _storage.read(key: _cachedCounter);

    if (jsonStr == null) throw CacheException();

    return int.parse(jsonStr);
  }

  Future<void> saveCounter(CounterDataParams counterDataParams) async {
    await _storage.write(
      key: _cachedCounter,
      value: counterDataParams.value.toString(),
    );
  }
}
