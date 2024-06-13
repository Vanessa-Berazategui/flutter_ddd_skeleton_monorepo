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
      CounterRemoteDataSource(api: api);

  @lazySingleton
  CounterLocalDataSource counterLocalDataSource(
    FlutterSecureStorage storage,
  ) =>
      CounterLocalDataSource(
        storage: storage,
      );
}
