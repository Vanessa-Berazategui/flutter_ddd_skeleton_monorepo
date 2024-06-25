// Flutter imports:

// Package imports:
import 'package:bloc_test/bloc_test.dart';
// Flutter imports:
import 'package:flutter_ddd_skeleton_monorepo/app/app.dart';
import 'package:flutter_ddd_skeleton_monorepo/counter/counter.dart';
// Project imports:

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/helpers.dart';

class MockCounterBloc extends MockCubit<CounterState> implements CounterBloc {}

void main() {
  /// Blocs
  late CounterBloc counterBloc;

  group('CounterView', () {
    setUp(() {
      counterBloc = MockCounterBloc();
    });

    testWidgets('renders CounterView', (tester) async {
      when(() => counterBloc.state).thenReturn(
        const CounterState(
          loading: false,
          isDone: true,
          value: 0,
          quiz: '',
        ),
      );
      await tester.pumpApp(
        BlocProvider.value(
          value: counterBloc,
          child: const CounterView(),
        ),
      );
      expect(find.byType(CounterView), findsOneWidget);
    });
  });

  group('CounterView', () {
    setUp(() {
      counterBloc = MockCounterBloc();
    });

    testWidgets('renders current value', (tester) async {
      const state = 42;
      when(() => counterBloc.state).thenReturn(
        const CounterState(
          loading: false,
          isDone: true,
          value: state,
          quiz: '',
        ),
      );
      await tester.pumpApp(
        BlocProvider.value(
          value: counterBloc,
          child: const CounterView(),
        ),
      );
      expect(find.text('$state'), findsOneWidget);
    });

    testWidgets('calls increment when increment button is tapped',
        (tester) async {
      when(() => counterBloc.state).thenReturn(
        const CounterState(
          loading: false,
          isDone: true,
          value: 0,
          quiz: '',
        ),
      );
      when(() => counterBloc.increment()).thenReturn(null);
      await tester.pumpApp(
        BlocProvider.value(
          value: counterBloc,
          child: const CounterView(),
        ),
      );
      await tester.tap(find.byIcon(Icons.add));
      verify(() => counterBloc.increment()).called(1);
    });

    testWidgets('calls decrement when decrement button is tapped',
        (tester) async {
      when(() => counterBloc.state).thenReturn(
        const CounterState(
          loading: false,
          isDone: true,
          value: 0,
          quiz: '',
        ),
      );
      when(() => counterBloc.decrement()).thenReturn(null);
      await tester.pumpApp(
        BlocProvider.value(
          value: counterBloc,
          child: const CounterView(),
        ),
      );
      await tester.tap(find.byIcon(Icons.remove));
      verify(() => counterBloc.decrement()).called(1);
    });

    testWidgets('calls quiz when quiz button is tapped', (tester) async {
      const state = 16;
      when(() => counterBloc.state).thenReturn(
        const CounterState(
          loading: false,
          isDone: true,
          value: state,
          quiz: 'quiz',
        ),
      );
      when(() => counterBloc.quiz()).thenAnswer((invocation) => Future.value());
      await tester.pumpApp(
        BlocProvider.value(
          value: counterBloc,
          child: const CounterView(),
        ),
      );
      await tester.tap(find.byIcon(Icons.quiz));
      verify(() => counterBloc.quiz()).called(1);
      expect(find.byKey(const Key('quiz')), findsOneWidget);
    });
  });
}
