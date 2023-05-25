import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pine_app/shared/data/local/storage_service.dart';
import 'package:pine_app/shared/data/providers/dio_network_service_provider.dart';
import 'package:pine_app/shared/data/providers/sharedpreferences_storage_service_provider.dart';
import 'package:pine_app/shared/data/remote/network_service.dart';
import 'package:pine_app/shared/globals.dart';
import 'package:pine_app/shared/models/authentication/authentication_model.dart';
import 'package:pine_app/shared/services/authentication_service.dart';

final authenticationRepositoryProvider = Provider<AuthenticationRepository>(
  (ref) {
    final AuthenticationService authenticationService =
        ref.watch(authenticationServiceProvider);
    final NetworkService networkService = ref.watch(netwokServiceProvider);
    final StroageService stroageService = ref.watch(storageServiceProvider);

    return AuthenticationRepository(
      authenticationService: authenticationService,
      networkService: networkService,
      stroageService: stroageService,
    );
  },
);

enum AuthenticationRepositoryStatus {
  initial,
  loading,
  loaded,
  failure,
}

class AuthenticationRepository {
  String get accessTokenStorageKey => ACCESS_TOKEN_STORAGE_KEY;
  String get refreshTokenStorageKey => REFRESH_TOKEN_STORAGE_KEY;

  final AuthenticationService authenticationService;
  final NetworkService networkService;
  final StroageService stroageService;

  String? accessToken;
  String? refreshToken;
  int? expiresIn;
  AuthenticationRepositoryStatus? status;
  String? message;

  initial() {
    status = AuthenticationRepositoryStatus.initial;
    accessToken = "";
    refreshToken = "";
    expiresIn = 3600;
  }

  AuthenticationRepository({
    required this.authenticationService,
    required this.networkService,
    required this.stroageService,
  });

  stroageToken({required String accessToken, String? refreshToken}) {
    stroageService.set(accessTokenStorageKey, accessToken);
    if (refreshToken != null) {
      stroageService.set(refreshTokenStorageKey, refreshToken);
    }
  }

  authLogin({required String email, required String password}) async {
    status = AuthenticationRepositoryStatus.loading;
    final authenticationResponse = await authenticationService.postAuthLogin(
      email: email,
      password: password,
    );
    authenticationResponse.fold((exception) {
      status = AuthenticationRepositoryStatus.failure;
      message = exception.message;
    }, (response) {
      status = AuthenticationRepositoryStatus.loaded;
      message = "";

      final authenticationEntity = Authentication.fromJson(response.data);
      accessToken = authenticationEntity.accessToken;
      refreshToken = authenticationEntity.refreshToken;
      expiresIn = authenticationEntity.expiresIn;
      stroageToken(
        accessToken: accessToken.toString(),
        refreshToken: refreshToken.toString(),
      );
      networkService
          .updateHeader({'Authorization': authenticationEntity.accessToken});
    });
  }
}
