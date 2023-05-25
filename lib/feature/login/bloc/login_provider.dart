// ignore_for_file: unused_import

import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'login_notifier.dart';
import 'login_state.dart';
import 'package:pine_app/shared/services/authentication_service.dart';

final loginProvider = StateNotifierProvider<LoginNotifier, LoginState>((ref) {
  final AuthenticationService authenticationService =
      ref.watch(authenticationServiceProvider);

  return LoginNotifier(authenticationService: authenticationService)..initial();
});
