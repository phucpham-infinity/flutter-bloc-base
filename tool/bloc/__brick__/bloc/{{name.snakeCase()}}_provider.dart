// ignore_for_file: unused_import

import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '{{name.snakeCase()}}_notifier.dart';
import '{{name.snakeCase()}}_state.dart';
import 'package:pine_app/shared/services/{{service.camelCase()}}_service.dart';


final {{name.camelCase()}}Provider =
    StateNotifierProvider<{{name.pascalCase()}}Notifier, {{name.pascalCase()}}State>((ref) {
  final {{service.pascalCase()}}Service {{service.camelCase()}}Service = ref.watch({{service.camelCase()}}ServiceProvider);

  return {{name.pascalCase()}}Notifier({{service.camelCase()}}Service: {{service.camelCase()}}Service)..initial();
});
