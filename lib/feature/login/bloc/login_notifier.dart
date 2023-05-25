// ignore_for_file: unused_import

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'login_state.dart';
import 'package:pine_app/shared/services/authentication_service.dart';

class LoginNotifier extends StateNotifier<LoginState> {
  final AuthenticationService authenticationService;
  LoginNotifier({required this.authenticationService})
      : super(const LoginState.initial());

  initial() {
    print('[initial] LoginNotifier');
  }

  void resetState() {
    state = const LoginState.initial();
  }
}
