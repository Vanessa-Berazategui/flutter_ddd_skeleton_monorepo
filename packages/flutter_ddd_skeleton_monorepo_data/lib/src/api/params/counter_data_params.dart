// Package imports:
// Project imports:
import 'package:flutter_ddd_skeleton_monorepo_data/src/models/base/base_model.dart';
import 'package:flutter_ddd_skeleton_monorepo_domain/flutter_ddd_skeleton_monorepo_domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'counter_data_params.g.dart';

@JsonSerializable(explicitToJson: true)
class CounterDataParams extends CounterParams implements BaseModel {
  const CounterDataParams({required super.value});

  factory CounterDataParams.fromDomain(CounterParams params) =>
      CounterDataParams(
        value: params.value,
      );

  @override
  Map<String, dynamic> toJson() => _$CounterDataParamsToJson(this);
}
