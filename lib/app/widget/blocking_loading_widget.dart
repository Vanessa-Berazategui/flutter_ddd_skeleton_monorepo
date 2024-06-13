// Project imports:
import 'package:flutter_ddd_skeleton_monorepo/app/app.dart';

class BlockingLoadingWidget extends StatelessWidget {
  const BlockingLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final colors = context.colors;

    return ColoredBox(
      color: theme.scaffoldBackgroundColor.withOpacity(0.6),
      child: Center(
        child: CircularProgressIndicator(
          color: colors.primary,
        ),
      ),
    );
  }
}
