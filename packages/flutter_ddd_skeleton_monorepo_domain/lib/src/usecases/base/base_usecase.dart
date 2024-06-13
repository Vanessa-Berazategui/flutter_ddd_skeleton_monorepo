// Package imports:
// Project imports:
import 'package:flutter_ddd_skeleton_monorepo_domain/flutter_ddd_skeleton_monorepo_domain.dart';
import 'package:meta/meta.dart';

@immutable
abstract class BaseUseCase<Type, Params extends BaseEntity> {
  const BaseUseCase();

  Future<Result<Type>> call(Params params);
}
