import 'package:flutter/material.dart';
import 'package:flutter_utils/src/pages/theme/widgets/custom_list_view.dart';

const Icon _buttonIcon = Icon(Icons.info);

class ButtonsPage extends StatelessWidget {
  const ButtonsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomListView(
      padding: const EdgeInsets.all(16),
      children: [
        _ButtonsRow(
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text('Elevated button'),
            ),
            const ElevatedButton(
              onPressed: null,
              child: Text('Disabled'),
            ),
          ],
        ),
        _ButtonsRow(
          children: [
            ElevatedButton.icon(
              onPressed: () {},
              icon: _buttonIcon,
              label: const Text('Elevated button icon'),
            ),
            ElevatedButton.icon(
              onPressed: null,
              icon: _buttonIcon,
              label: const Text('Disabled'),
            ),
          ],
        ),
        _ButtonsRow(
          children: [
            OutlinedButton(
              onPressed: () {},
              child: const Text('Outlined button'),
            ),
            const OutlinedButton(
              onPressed: null,
              child: Text('Disabled'),
            ),
          ],
        ),
        _ButtonsRow(
          children: [
            OutlinedButton.icon(
              onPressed: () {},
              icon: _buttonIcon,
              label: const Text('Outlined button icon'),
            ),
            OutlinedButton.icon(
              onPressed: null,
              icon: _buttonIcon,
              label: const Text('Disabled'),
            ),
          ],
        ),
        _ButtonsRow(
          children: [
            TextButton(
              onPressed: () {},
              child: const Text('Text button'),
            ),
            const TextButton(
              onPressed: null,
              child: Text('Disabled'),
            ),
          ],
        ),
        _ButtonsRow(
          children: [
            TextButton.icon(
              onPressed: () {},
              icon: _buttonIcon,
              label: const Text('Text button icon'),
            ),
            TextButton.icon(
              onPressed: null,
              icon: _buttonIcon,
              label: const Text('Disabled'),
            ),
          ],
        ),
        const Divider(),
        _IconButtons(),
        const SizedBox(height: 50),
      ],
    );
  }
}

class _ButtonsRow extends StatelessWidget {
  const _ButtonsRow({required this.children, Key? key}) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => children[index],
        separatorBuilder: (context, index) => const SizedBox(width: 16),
        itemCount: children.length,
      ),
    );
  }
}

class _IconButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final labelStyle = TextStyle(color: Theme.of(context).disabledColor);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Icon buttons',
          style: TextStyle(fontSize: 16),
        ),
        Row(
          children: [
            Text(
              'Enabled',
              style: labelStyle,
            ),
            IconButton(
              icon: _buttonIcon,
              onPressed: () {},
            ),
            const SizedBox(width: 4),
            Text(
              'Disabled',
              style: labelStyle,
            ),
            const IconButton(
              icon: _buttonIcon,
              onPressed: null,
            ),
          ],
        )
      ],
    );
  }
}
