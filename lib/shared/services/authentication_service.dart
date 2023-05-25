import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:pine_app/shared/data/remote/remote.dart';
import 'package:pine_app/shared/exceptions/http_exception.dart';
import 'package:pine_app/shared/data/providers/dio_network_service_provider.dart';
import 'package:pine_app/shared/models/response.dart' as response;

final authenticationServiceProvider = Provider<AuthenticationService>(
  (ref) {
    final NetworkService networkService = ref.watch(netwokServiceProvider);
    return AuthenticationService(networkService);
  },
);

class AuthenticationService {
  final NetworkService networkService;

  AuthenticationService(this.networkService);

  Future<Either<AppException, response.Response>> postAuthLogin({
    required String email,
    required String password,
  }) async {
    return networkService
        .post('/auth/login', data: {'email': email, 'password': password});
  }

  Future<Either<AppException, response.Response>> postAuthSignup({
    required String email,
    required String password,
    required String name,
  }) async {
    return networkService.post('/auth/signup',
        data: {'email': email, 'password': password, 'name': name});
  }

  Future<Either<AppException, response.Response>> postAuthRefresh({
    required String refreshToken,
  }) async {
    return networkService
        .post('/auth/refresh', data: {'refresh_token': refreshToken});
  }

  Future<Either<AppException, response.Response>> postAuthForgotPassword({
    required String email,
  }) async {
    return networkService.post('/auth/forgot-password', data: {'email': email});
  }

  Future<Either<AppException, response.Response>> postAuthResetPassword({
    required String resetToken,
    required String newPassword,
  }) async {
    return networkService.post('/auth/reset-password',
        data: {'reset_token': resetToken, 'new_password': newPassword});
  }
}
