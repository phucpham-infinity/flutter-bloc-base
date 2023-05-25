// ignore_for_file: unused_import

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '{{name.snakeCase()}}_state.dart';
import 'package:pine_app/shared/services/{{service.snakeCase()}}_service.dart';

class {{name.pascalCase()}}Notifier extends StateNotifier<{{name.pascalCase()}}State> {
  final {{service.pascalCase()}}Service {{service.camelCase()}}Service;
  {{name.pascalCase()}}Notifier({required this.{{service.camelCase()}}Service})
      : super(const {{name.pascalCase()}}State.initial());

  initial() {
    print('[initial] {{name.pascalCase()}}Notifier');
  }

  void resetState() {
    state = const {{name.pascalCase()}}State.initial();
  }
}
