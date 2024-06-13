// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'counter_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CounterState {
  bool get loading => throw _privateConstructorUsedError;
  bool get isDone => throw _privateConstructorUsedError;
  int get value => throw _privateConstructorUsedError;
  String get quiz => throw _privateConstructorUsedError;
  Failure? get failure => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CounterStateCopyWith<CounterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CounterStateCopyWith<$Res> {
  factory $CounterStateCopyWith(
          CounterState value, $Res Function(CounterState) then) =
      _$CounterStateCopyWithImpl<$Res, CounterState>;
  @useResult
  $Res call(
      {bool loading, bool isDone, int value, String quiz, Failure? failure});

  $FailureCopyWith<$Res>? get failure;
}

/// @nodoc
class _$CounterStateCopyWithImpl<$Res, $Val extends CounterState>
    implements $CounterStateCopyWith<$Res> {
  _$CounterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? isDone = null,
    Object? value = null,
    Object? quiz = null,
    Object? failure = freezed,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      isDone: null == isDone
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
      quiz: null == quiz
          ? _value.quiz
          : quiz // ignore: cast_nullable_to_non_nullable
              as String,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FailureCopyWith<$Res>? get failure {
    if (_value.failure == null) {
      return null;
    }

    return $FailureCopyWith<$Res>(_value.failure!, (value) {
      return _then(_value.copyWith(failure: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CounterStateImplCopyWith<$Res>
    implements $CounterStateCopyWith<$Res> {
  factory _$$CounterStateImplCopyWith(
          _$CounterStateImpl value, $Res Function(_$CounterStateImpl) then) =
      __$$CounterStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool loading, bool isDone, int value, String quiz, Failure? failure});

  @override
  $FailureCopyWith<$Res>? get failure;
}

/// @nodoc
class __$$CounterStateImplCopyWithImpl<$Res>
    extends _$CounterStateCopyWithImpl<$Res, _$CounterStateImpl>
    implements _$$CounterStateImplCopyWith<$Res> {
  __$$CounterStateImplCopyWithImpl(
      _$CounterStateImpl _value, $Res Function(_$CounterStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? isDone = null,
    Object? value = null,
    Object? quiz = null,
    Object? failure = freezed,
  }) {
    return _then(_$CounterStateImpl(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      isDone: null == isDone
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
      quiz: null == quiz
          ? _value.quiz
          : quiz // ignore: cast_nullable_to_non_nullable
              as String,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ));
  }
}

/// @nodoc

class _$CounterStateImpl implements _CounterState {
  const _$CounterStateImpl(
      {required this.loading,
      required this.isDone,
      required this.value,
      required this.quiz,
      this.failure});

  @override
  final bool loading;
  @override
  final bool isDone;
  @override
  final int value;
  @override
  final String quiz;
  @override
  final Failure? failure;

  @override
  String toString() {
    return 'CounterState(loading: $loading, isDone: $isDone, value: $value, quiz: $quiz, failure: $failure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CounterStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.isDone, isDone) || other.isDone == isDone) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.quiz, quiz) || other.quiz == quiz) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, loading, isDone, value, quiz, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CounterStateImplCopyWith<_$CounterStateImpl> get copyWith =>
      __$$CounterStateImplCopyWithImpl<_$CounterStateImpl>(this, _$identity);
}

abstract class _CounterState implements CounterState {
  const factory _CounterState(
      {required final bool loading,
      required final bool isDone,
      required final int value,
      required final String quiz,
      final Failure? failure}) = _$CounterStateImpl;

  @override
  bool get loading;
  @override
  bool get isDone;
  @override
  int get value;
  @override
  String get quiz;
  @override
  Failure? get failure;
  @override
  @JsonKey(ignore: true)
  _$$CounterStateImplCopyWith<_$CounterStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
