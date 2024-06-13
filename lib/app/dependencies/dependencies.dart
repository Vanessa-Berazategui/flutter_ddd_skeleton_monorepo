// Package imports:
// Project imports:
import 'package:flutter_ddd_skeleton_monorepo/app/dependencies/dependencies.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

export 'blocs_module.dart';
export 'blocs_provider.dart';
export 'datasources_module.dart';
export 'packages_module.dart';
export 'repositories_module.dart';
export 'usecases_module.dart';

final getIt = GetIt.I;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: false,
  asExtension: true,
)
Future<void> setupDependencies({
  required String env,
}) async =>
    getIt.init(environment: env);
