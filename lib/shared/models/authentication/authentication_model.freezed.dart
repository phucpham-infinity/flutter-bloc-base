// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'authentication_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Authentication _$AuthenticationFromJson(Map<String, dynamic> json) {
  return _Authentication.fromJson(json);
}

/// @nodoc
mixin _$Authentication {
  @JsonKey(name: 'access_token')
  String get accessToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'refresh_token')
  String get refreshToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'expires_in')
  int get expiresIn => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthenticationCopyWith<Authentication> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationCopyWith<$Res> {
  factory $AuthenticationCopyWith(
          Authentication value, $Res Function(Authentication) then) =
      _$AuthenticationCopyWithImpl<$Res, Authentication>;
  @useResult
  $Res call(
      {@JsonKey(name: 'access_token') String accessToken,
      @JsonKey(name: 'refresh_token') String refreshToken,
      @JsonKey(name: 'expires_in') int expiresIn});
}

/// @nodoc
class _$AuthenticationCopyWithImpl<$Res, $Val extends Authentication>
    implements $AuthenticationCopyWith<$Res> {
  _$AuthenticationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? expiresIn = null,
  }) {
    return _then(_value.copyWith(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      expiresIn: null == expiresIn
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AuthenticationCopyWith<$Res>
    implements $AuthenticationCopyWith<$Res> {
  factory _$$_AuthenticationCopyWith(
          _$_Authentication value, $Res Function(_$_Authentication) then) =
      __$$_AuthenticationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'access_token') String accessToken,
      @JsonKey(name: 'refresh_token') String refreshToken,
      @JsonKey(name: 'expires_in') int expiresIn});
}

/// @nodoc
class __$$_AuthenticationCopyWithImpl<$Res>
    extends _$AuthenticationCopyWithImpl<$Res, _$_Authentication>
    implements _$$_AuthenticationCopyWith<$Res> {
  __$$_AuthenticationCopyWithImpl(
      _$_Authentication _value, $Res Function(_$_Authentication) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? expiresIn = null,
  }) {
    return _then(_$_Authentication(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      expiresIn: null == expiresIn
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Authentication implements _Authentication {
  const _$_Authentication(
      {@JsonKey(name: 'access_token') this.accessToken = '',
      @JsonKey(name: 'refresh_token') this.refreshToken = '',
      @JsonKey(name: 'expires_in') this.expiresIn = ''});

  factory _$_Authentication.fromJson(Map<String, dynamic> json) =>
      _$$_AuthenticationFromJson(json);

  @override
  @JsonKey(name: 'access_token')
  final String accessToken;
  @override
  @JsonKey(name: 'refresh_token')
  final String refreshToken;
  @override
  @JsonKey(name: 'expires_in')
  final int expiresIn;

  @override
  String toString() {
    return 'Authentication(accessToken: $accessToken, refreshToken: $refreshToken, expiresIn: $expiresIn)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Authentication &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.expiresIn, expiresIn) ||
                other.expiresIn == expiresIn));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, accessToken, refreshToken, expiresIn);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthenticationCopyWith<_$_Authentication> get copyWith =>
      __$$_AuthenticationCopyWithImpl<_$_Authentication>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthenticationToJson(
      this,
    );
  }
}

abstract class _Authentication implements Authentication {
  const factory _Authentication(
      {@JsonKey(name: 'access_token') final String accessToken,
      @JsonKey(name: 'refresh_token') final String refreshToken,
      @JsonKey(name: 'expires_in') final int expiresIn}) = _$_Authentication;

  factory _Authentication.fromJson(Map<String, dynamic> json) =
      _$_Authentication.fromJson;

  @override
  @JsonKey(name: 'access_token')
  String get accessToken;
  @override
  @JsonKey(name: 'refresh_token')
  String get refreshToken;
  @override
  @JsonKey(name: 'expires_in')
  int get expiresIn;
  @override
  @JsonKey(ignore: true)
  _$$_AuthenticationCopyWith<_$_Authentication> get copyWith =>
      throw _privateConstructorUsedError;
}

AuthenticationList _$AuthenticationListFromJson(Map<String, dynamic> json) {
  return _AuthenticationList.fromJson(json);
}

/// @nodoc
mixin _$AuthenticationList {
  List<Authentication> get authenticationList =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthenticationListCopyWith<AuthenticationList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationListCopyWith<$Res> {
  factory $AuthenticationListCopyWith(
          AuthenticationList value, $Res Function(AuthenticationList) then) =
      _$AuthenticationListCopyWithImpl<$Res, AuthenticationList>;
  @useResult
  $Res call({List<Authentication> authenticationList});
}

/// @nodoc
class _$AuthenticationListCopyWithImpl<$Res, $Val extends AuthenticationList>
    implements $AuthenticationListCopyWith<$Res> {
  _$AuthenticationListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authenticationList = null,
  }) {
    return _then(_value.copyWith(
      authenticationList: null == authenticationList
          ? _value.authenticationList
          : authenticationList // ignore: cast_nullable_to_non_nullable
              as List<Authentication>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AuthenticationListCopyWith<$Res>
    implements $AuthenticationListCopyWith<$Res> {
  factory _$$_AuthenticationListCopyWith(_$_AuthenticationList value,
          $Res Function(_$_AuthenticationList) then) =
      __$$_AuthenticationListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Authentication> authenticationList});
}

/// @nodoc
class __$$_AuthenticationListCopyWithImpl<$Res>
    extends _$AuthenticationListCopyWithImpl<$Res, _$_AuthenticationList>
    implements _$$_AuthenticationListCopyWith<$Res> {
  __$$_AuthenticationListCopyWithImpl(
      _$_AuthenticationList _value, $Res Function(_$_AuthenticationList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authenticationList = null,
  }) {
    return _then(_$_AuthenticationList(
      authenticationList: null == authenticationList
          ? _value._authenticationList
          : authenticationList // ignore: cast_nullable_to_non_nullable
              as List<Authentication>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AuthenticationList implements _AuthenticationList {
  const _$_AuthenticationList(
      {final List<Authentication> authenticationList = const []})
      : _authenticationList = authenticationList;

  factory _$_AuthenticationList.fromJson(Map<String, dynamic> json) =>
      _$$_AuthenticationListFromJson(json);

  final List<Authentication> _authenticationList;
  @override
  @JsonKey()
  List<Authentication> get authenticationList {
    if (_authenticationList is EqualUnmodifiableListView)
      return _authenticationList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_authenticationList);
  }

  @override
  String toString() {
    return 'AuthenticationList(authenticationList: $authenticationList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthenticationList &&
            const DeepCollectionEquality()
                .equals(other._authenticationList, _authenticationList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_authenticationList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthenticationListCopyWith<_$_AuthenticationList> get copyWith =>
      __$$_AuthenticationListCopyWithImpl<_$_AuthenticationList>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthenticationListToJson(
      this,
    );
  }
}

abstract class _AuthenticationList implements AuthenticationList {
  const factory _AuthenticationList(
      {final List<Authentication> authenticationList}) = _$_AuthenticationList;

  factory _AuthenticationList.fromJson(Map<String, dynamic> json) =
      _$_AuthenticationList.fromJson;

  @override
  List<Authentication> get authenticationList;
  @override
  @JsonKey(ignore: true)
  _$$_AuthenticationListCopyWith<_$_AuthenticationList> get copyWith =>
      throw _privateConstructorUsedError;
}
