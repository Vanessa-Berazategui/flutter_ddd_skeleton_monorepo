// Project imports:
import 'package:flutter_ddd_skeleton_monorepo/app/app.dart';
import 'package:flutter_ddd_skeleton_monorepo/bootstrap.dart';

void main() {
  bootstrap(() => const App(), env: AppEnvironment.prod);
}
