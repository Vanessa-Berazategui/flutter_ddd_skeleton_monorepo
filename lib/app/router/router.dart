// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter_ddd_skeleton_monorepo/app/app.dart';
import 'package:flutter_ddd_skeleton_monorepo/counter/counter.dart';
import 'package:go_router/go_router.dart';
// Project imports:

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: CounterPage.route,
  routes: [
    CounterPage(),
  ],
  debugLogDiagnostics: kDebugMode,
);
