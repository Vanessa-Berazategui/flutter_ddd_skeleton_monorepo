// Package imports:
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'counter_response.g.dart';

@JsonSerializable(explicitToJson: true)
class CounterResponse extends Equatable {
  const CounterResponse({
    required this.text,
    required this.found,
    required this.number,
    required this.type,
  });

  factory CounterResponse.fromJson(Map<String, dynamic> json) =>
      _$CounterResponseFromJson(json);

  final String text;
  final bool found;
  final int number;
  final String type;

  @override
  List<Object?> get props => [
        text,
        found,
        number,
        type,
      ];
}
