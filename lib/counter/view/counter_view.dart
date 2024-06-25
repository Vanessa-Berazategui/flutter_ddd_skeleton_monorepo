import 'package:flutter_ddd_skeleton_monorepo/app/app.dart';
import 'package:flutter_ddd_skeleton_monorepo/counter/counter.dart';
import 'package:flutter_ddd_skeleton_monorepo_domain/flutter_ddd_skeleton_monorepo_domain.dart';

class CounterView extends StatelessWidget {
  const CounterView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = context.theme;
    final colors = context.colors;

    final bloc = context.read<CounterBloc>();

    return Scaffold(
      body: BlocConsumer<CounterBloc, CounterState>(
        listenWhen: (previous, current) =>
            current.failure != null || current.isDone,
        listener: (context, state) {
          if (state.failure != null) {
            state.failure!.maybeMap(
              cache: (_) => context.showWarnMessage(l10n.counterEmptyCache),
              quiz: (_) => context.showErrorMessage(l10n.counterEmptyQuiz),
              orElse: () =>
                  context.showWarnMessage(state.failure!.errorMessage),
            );

            bloc.cleanFailure();
          }
        },
        buildWhen: (previous, current) =>
            previous.loading != current.loading ||
            previous.value != current.value ||
            previous.quiz != current.quiz,
        builder: (context, state) {
          return Stack(
            fit: StackFit.expand,
            children: [
              Scaffold(
                appBar: AppBar(title: Text(l10n.counterAppBarTitle)),
                body: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      const SizedBox(height: 50),
                      Text(
                        'Presiona el botón de quiz para descubir una curiosidad sobre tu número',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: colors.secondary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        '${state.value}',
                        style: theme.textTheme.displayLarge?.copyWith(
                          color: colors.secondary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      if (state.quiz.isNotEmpty)
                        Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16)),
                            color: colors.primary,
                          ),
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            key: const Key('quiz'),
                            state.quiz.toUpperCase(),
                            style: theme.textTheme.bodyLarge
                                ?.copyWith(color: colors.onPrimary),
                          ),
                        ),
                    ],
                  ),
                ),
                floatingActionButton: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FloatingActionButton(
                      onPressed: bloc.increment,
                      child: const Icon(Icons.add),
                    ),
                    const SizedBox(height: 8),
                    FloatingActionButton(
                      onPressed: bloc.decrement,
                      child: const Icon(Icons.remove),
                    ),
                    const SizedBox(height: 8),
                    FloatingActionButton(
                      onPressed: bloc.save,
                      child: const Icon(Icons.save),
                    ),
                    const SizedBox(height: 8),
                    FloatingActionButton(
                      onPressed: bloc.quiz,
                      child: const Icon(Icons.quiz),
                    ),
                  ],
                ),
              ),
              if (state.loading) const BlockingLoadingWidget(),
            ],
          );
        },
      ),
    );
  }
}
