import 'package:flutter_ddd_skeleton_monorepo/app/app.dart';
import 'package:flutter_ddd_skeleton_monorepo/counter/counter.dart';
import 'package:go_router/go_router.dart';

class CounterPage extends GoRoute {
  CounterPage()
      : super(
          name: route,
          path: _path,
          builder: (context, state) => BlocProvider<CounterBloc>(
            create: (context) => getIt(),
            child: const CounterView(),
          ),
        );

  static const _path = '/counter';

  static String get route => _path;

  static void open(BuildContext context) => context.go(route);
}
