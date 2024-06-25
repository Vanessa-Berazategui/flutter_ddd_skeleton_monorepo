// Package imports:
import 'package:flutter_ddd_skeleton_monorepo_data/flutter_ddd_skeleton_monorepo_data.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppDataSourcesModule {
  //============================
  // Counter
  //============================
  @lazySingleton
  CounterRemoteDataSource counterRemoteDataSource(
    FlutterDddSkeletonMonorepoApi api,
  ) =>
      CounterDataRemoteDataSource(api: api);

  @lazySingleton
  CounterLocalDataSource counterLocalDataSource(
    FlutterSecureStorage storage,
  ) =>
      CounterDataLocalDataSource(
        storage: storage,
      );
}
