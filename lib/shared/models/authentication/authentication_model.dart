// ignore_for_file: invalid_annotation_target, depend_on_referenced_packages

import 'package:freezed_annotation/freezed_annotation.dart';

part 'authentication_model.freezed.dart';
part 'authentication_model.g.dart';

@freezed
abstract class Authentication with _$Authentication {
  const factory Authentication({
    @Default('') @JsonKey(name: 'access_token') String accessToken,
    @Default('') @JsonKey(name: 'refresh_token') String refreshToken,
    @Default('') @JsonKey(name: 'expires_in') int expiresIn,
  }) = _Authentication;

  factory Authentication.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationFromJson(json);
}

@freezed
abstract class AuthenticationList with _$AuthenticationList {
  const factory AuthenticationList({
    @Default([]) List<Authentication> authenticationList,
  }) = _AuthenticationList;
  factory AuthenticationList.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationListFromJson(json);
}
