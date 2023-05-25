// ignore_for_file: unused_import

import 'package:equatable/equatable.dart';

enum LoginStatus {
  initial,
  loading,
  loaded,
  failure,
}

class LoginState extends Equatable {
  final LoginStatus status;
  final String message;

  const LoginState({
    this.status = LoginStatus.initial,
    this.message = "",
  });

  const LoginState.initial({
    this.message = "",
    this.status = LoginStatus.initial,
  });

  LoginState copyWith({
    LoginStatus? status,
    String? message,
  }) {
    return LoginState(
      message: message ?? this.message,
      status: status ?? this.status,
    );
  }

  @override
  String toString() {
    return 'LoginState(status: $status, message: $message)';
  }

  @override
  List<Object?> get props => [status, message];
}
