import 'package:flutter/material.dart';
import 'package:flutter_utils/src/pages/theme/widgets/custom_list_view.dart';

class TextPage extends StatelessWidget {
  const TextPage({super.key});

  String get label => 'Text';

  @override
  Widget build(BuildContext context) {
    return CustomListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(
          'Display large',
          style: Theme.of(context).textTheme.displayLarge,
        ),
        Text(
          'Display medium',
          style: Theme.of(context).textTheme.displayMedium,
        ),
        Text(
          'Display small',
          style: Theme.of(context).textTheme.displaySmall,
        ),
        Text(
          'Headline large',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        Text(
          'Headline medium',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Text(
          'Headline small',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        Text(
          'Title large',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Text(
          'Title medium',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text(
          'Title small',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        Text(
          'Label large',
          style: Theme.of(context).textTheme.labelLarge,
        ),
        Text(
          'Label medium',
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Text(
          'Label small',
          style: Theme.of(context).textTheme.labelSmall,
        ),
        Text(
          'Body large',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Text(
          'Body medium',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Text(
          'Body small',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
