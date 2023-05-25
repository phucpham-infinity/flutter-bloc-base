import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pine_app/shared/services/{{name.camelCase()}}_service.dart';

final {{name.camelCase()}}RepositoryProvider = Provider<{{name.pascalCase()}}Repository>(
  (ref) {
    final {{name.pascalCase()}}Service {{name.camelCase()}}Service =
        ref.watch(authenticationServiceProvider);

    return {{name.pascalCase()}}Repository(
      {{name.camelCase()}}Service: {{name.camelCase()}}Service,
    );
  },
);

enum {{name.pascalCase()}}RepositoryStatus {
  initial,
  loading,
  loaded,
  failure,
}

class {{name.pascalCase()}}Repository {
  final {{name.pascalCase()}}Service {{name.camelCase()}}Service;

  {{name.pascalCase()}}RepositoryStatus? status;
  String? message;

  initial() {
    status = {{name.pascalCase()}}RepositoryStatus.initial;
    message = "";
  }

  {{name.pascalCase()}}Repository({
    required this.{{name.camelCase()}}Service,
  });
}
