import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_ios/local_auth_ios.dart';

class AuthBiometrics {
  static final _auth = LocalAuthentication();

  static Future<bool> hasBiometrics() async {
    try {
      final check = await _auth.canCheckBiometrics;
      final List<BiometricType> availableBiometrics =
          await _auth.getAvailableBiometrics();
      log(availableBiometrics.toString());
      final isSupport = await _auth.isDeviceSupported();
      log('check $check');
      log('isSupport $isSupport');

      return check || isSupport;
    } on PlatformException {
      return false;
    }
  }

  static Future<bool> hasFaceID() async {
    try {
      final List<BiometricType> availableBiometrics =
          await _auth.getAvailableBiometrics();
      final check = availableBiometrics.contains(BiometricType.face);
      return check;
    } on PlatformException {
      return false;
    }
  }

  static Future<bool> authenticate() async {
    final isAvailable = await hasBiometrics();
    if (!isAvailable) return false;

    try {
      final bool check = await _auth.authenticate(
        localizedReason:
            'Scan your fingerprint (or face or whatever) to authenticate',
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: true,
          biometricOnly: true,
        ),
        authMessages: const <AuthMessages>[
          AndroidAuthMessages(
            signInTitle: 'Oops! Biometric authentication required!',
            cancelButton: 'No thanks',
          ),
          IOSAuthMessages(
            cancelButton: 'No thanks',
          ),
        ],
      );
      log('authenticate $check');
      return check;
    } on PlatformException {
      log('platform');
      return false;
    }
  }
}
