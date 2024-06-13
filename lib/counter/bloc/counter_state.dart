part of 'counter_bloc.dart';

@freezed
class CounterState with _$CounterState {
  const factory CounterState({
    required bool loading,
    required bool isDone,
    required int value,
    required String quiz,
    Failure? failure,
  }) = _CounterState;

  factory CounterState.init() => const CounterState(
        loading: false,
        isDone: false,
        value: 0,
        quiz: '',
      );
}
