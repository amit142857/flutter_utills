import 'package:flutter/material.dart';
import 'package:flutter_utils/src/pages/theme/widgets/custom_list_view.dart';

class InputsPage extends StatelessWidget {
  const InputsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: CustomListView(
        padding: const EdgeInsets.all(16),
        children: [
          _TextFieldEnabled(),
          _TextFieldDisabled(),
          _TextFieldHintHelperCounter(),
          _TextFieldPrefixSuffix(),
          _TextFieldError(),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}

class _TextFieldEnabled extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(labelText: 'Label'),
    );
  }
}

class _TextFieldDisabled extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const TextField(
      enabled: false,
      decoration: InputDecoration(labelText: 'Disabled'),
    );
  }
}

class _TextFieldHintHelperCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        hintText: 'Hint',
        helperText: 'Helper',
        counterText: 'Counter',
      ),
    );
  }
}

class _TextFieldPrefixSuffix extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: 'Input',
      decoration: const InputDecoration(
        prefixText: 'Prefix: ',
        suffixText: 'Suffix',
      ),
    );
  }
}

class _TextFieldError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        labelText: 'Label',
        errorText: 'Error',
      ),
    );
  }
}
