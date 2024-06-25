// Package imports:

// Project imports:
import 'package:flutter_ddd_skeleton_monorepo/app/app.dart';
import 'package:flutter_ddd_skeleton_monorepo/counter/counter.dart';
import 'package:flutter_ddd_skeleton_monorepo/main_production.dart' as app;
// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('App', () {
    testWidgets('renders App', (tester) async {
      app.main();
      await tester.pumpAndSettle();
      expect(find.byType(CounterView), findsOneWidget);
    });
  });

  group('CounterView', () {
    testWidgets('renders current value', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.text('0'), findsOneWidget);
    });

    testWidgets('see value of 1 when increment button is tapped',
        (tester) async {
      await tester.pumpWidget(const App());
      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();
      expect(find.text('1'), findsOneWidget);
    });

    testWidgets('see value of -1 when increment button is tapped',
        (tester) async {
      await tester.pumpWidget(const App());
      await tester.tap(find.byIcon(Icons.remove));
      await tester.pumpAndSettle();
      expect(find.text('-1'), findsOneWidget);
    });

    testWidgets('see quiz when quiz button is tapped', (tester) async {
      await tester.pumpWidget(const App());
      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(Icons.quiz));
      expect(find.byKey(const Key('quiz')), findsOneWidget);
    });
  });
}
