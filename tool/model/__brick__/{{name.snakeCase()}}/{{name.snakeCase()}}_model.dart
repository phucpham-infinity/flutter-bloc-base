// ignore_for_file: invalid_annotation_target, depend_on_referenced_packages

import 'package:freezed_annotation/freezed_annotation.dart';

part '{{name.snakeCase()}}_model.freezed.dart';
part '{{name.snakeCase()}}_model.g.dart';

@freezed
abstract class {{name.pascalCase()}} with _${{name.pascalCase()}} {
  const factory {{name.pascalCase()}}({
    @Default(0) int id,
  }) = _{{name.pascalCase()}};

  factory {{name.pascalCase()}}.fromJson(Map<String, dynamic> json) => _${{name.pascalCase()}}FromJson(json);
}

@freezed
abstract class {{name.pascalCase()}}List with _${{name.pascalCase()}}List {
  const factory {{name.pascalCase()}}List({
    @Default([]) List<{{name.pascalCase()}}> {{name.camelCase()}}List,
  }) = _{{name.pascalCase()}}List;
  factory {{name.pascalCase()}}List.fromJson(Map<String, dynamic> json) =>
      _${{name.pascalCase()}}ListFromJson(json);
}
