import 'package:flutter/material.dart';

class DebugColorPage extends StatelessWidget {
  const DebugColorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          tileColor: Theme.of(context).colorScheme.primary,
          textColor: Theme.of(context).colorScheme.onPrimary,
          title: const Text('Color Schema'),
          subtitle: const Text('primary'),
        ),
        ListTile(
          tileColor: Theme.of(context).colorScheme.onPrimary,
          textColor: Theme.of(context).colorScheme.primary,
          title: const Text('Color Schema'),
          subtitle: const Text('onPrimary'),
        ),
        ListTile(
          tileColor: Theme.of(context).colorScheme.secondary,
          textColor: Theme.of(context).colorScheme.onSecondary,
          title: const Text('Color Schema'),
          subtitle: const Text('secondary'),
        ),
        ListTile(
          tileColor: Theme.of(context).colorScheme.onSecondary,
          textColor: Theme.of(context).colorScheme.secondary,
          title: const Text('Color Schema'),
          subtitle: const Text('onSecondary'),
        ),
        ListTile(
          tileColor: Theme.of(context).colorScheme.error,
          textColor: Theme.of(context).colorScheme.onError,
          title: const Text('Color Schema'),
          subtitle: const Text('error'),
        ),
        ListTile(
          tileColor: Theme.of(context).colorScheme.onError,
          textColor: Theme.of(context).colorScheme.error,
          title: const Text('Color Schema'),
          subtitle: const Text('onError'),
        ),
        ListTile(
          tileColor: Theme.of(context).colorScheme.background,
          textColor: Theme.of(context).colorScheme.onBackground,
          title: const Text('Color Schema'),
          subtitle: const Text('background'),
        ),
        ListTile(
          tileColor: Theme.of(context).colorScheme.onBackground,
          textColor: Theme.of(context).colorScheme.background,
          title: const Text('Color Schema'),
          subtitle: const Text('onBackground'),
        ),
        ListTile(
          tileColor: Theme.of(context).colorScheme.surface,
          textColor: Theme.of(context).colorScheme.onSurface,
          title: const Text('Color Schema'),
          subtitle: const Text('surface'),
        ),
        ListTile(
          tileColor: Theme.of(context).colorScheme.onSurface,
          textColor: Theme.of(context).colorScheme.surface,
          title: const Text('Color Schema'),
          subtitle: const Text('onSurface'),
        ),
      ],
    );
  }
}
