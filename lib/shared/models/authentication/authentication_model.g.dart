// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Authentication _$$_AuthenticationFromJson(Map<String, dynamic> json) =>
    _$_Authentication(
      accessToken: json['access_token'] as String? ?? '',
      refreshToken: json['refresh_token'] as String? ?? '',
      expiresIn: json['expires_in'] as int? ?? '',
    );

Map<String, dynamic> _$$_AuthenticationToJson(_$_Authentication instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
      'expires_in': instance.expiresIn,
    };

_$_AuthenticationList _$$_AuthenticationListFromJson(
        Map<String, dynamic> json) =>
    _$_AuthenticationList(
      authenticationList: (json['authenticationList'] as List<dynamic>?)
              ?.map((e) => Authentication.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_AuthenticationListToJson(
        _$_AuthenticationList instance) =>
    <String, dynamic>{
      'authenticationList': instance.authenticationList,
    };
