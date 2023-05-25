// ignore_for_file: unused_import

import 'package:equatable/equatable.dart';

enum  {{name.pascalCase()}}Status {
  initial,
  loading,
  loaded,
  failure,
}

class {{name.pascalCase()}}State extends Equatable {
  final {{name.pascalCase()}}Status status;
  final String message;

  const {{name.pascalCase()}}State({
    this.status = {{name.pascalCase()}}Status.initial,
    this.message = "",
  });

  const {{name.pascalCase()}}State.initial({
    this.message = "",
    this.status = {{name.pascalCase()}}Status.initial,
  });

  {{name.pascalCase()}}State copyWith({
    {{name.pascalCase()}}Status? status,
    String? message,
  }) {
    return {{name.pascalCase()}}State(
      message: message ?? this.message,
      status: status ?? this.status,
    );
  }

  @override
  String toString() {
    return '{{name.pascalCase()}}State(status: $status, message: $message)';
  }

  @override
  List<Object?> get props => [status, message];
}
