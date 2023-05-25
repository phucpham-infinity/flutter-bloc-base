// ignore_for_file: library_private_types_in_public_api, implementation_imports

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pine_app/feature/login/bloc/login_provider.dart';

import 'bloc/login_state.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(loginProvider);
    ref.listen(
      loginProvider.select((value) => value),
      ((LoginState? previous, LoginState next) {
        //show Snackbar on failure
        if (next.status == LoginStatus.failure) {
          if (next.message.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Yay! A SnackBar!'),
            ));
          }
        }
        if (next.status == LoginStatus.loaded) {
          //  TODO:
        }
      }),
    );
    return const Placeholder();
  }
}
