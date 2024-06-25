// Package imports:
// Project imports:

import 'package:flutter_ddd_skeleton_monorepo_data/flutter_ddd_skeleton_monorepo_data.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class CounterLocalDataSource extends BaseDataSource {
  Future<int> getCounter();

  Future<void> saveCounter(CounterDataParams counterDataParams);
}

class CounterDataLocalDataSource implements CounterLocalDataSource {
  const CounterDataLocalDataSource({
    required FlutterSecureStorage storage,
  }) : _storage = storage;

  final FlutterSecureStorage _storage;

  static const _cachedCounter = 'CACHED_COUNTER';

  @override
  Future<int> getCounter() async {
    final jsonStr = await _storage.read(key: _cachedCounter);

    if (jsonStr == null) throw CacheException();

    return int.parse(jsonStr);
  }

  @override
  Future<void> saveCounter(CounterDataParams counterDataParams) async {
    await _storage.write(
      key: _cachedCounter,
      value: counterDataParams.value.toString(),
    );
  }
}
