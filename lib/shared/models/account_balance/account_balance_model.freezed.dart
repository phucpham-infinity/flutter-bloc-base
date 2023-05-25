// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_balance_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AccountBalance _$AccountBalanceFromJson(Map<String, dynamic> json) {
  return _AccountBalance.fromJson(json);
}

/// @nodoc
mixin _$AccountBalance {
  @JsonKey(name: 'account_id')
  String get accountId => throw _privateConstructorUsedError;
  String get balance => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountBalanceCopyWith<AccountBalance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountBalanceCopyWith<$Res> {
  factory $AccountBalanceCopyWith(
          AccountBalance value, $Res Function(AccountBalance) then) =
      _$AccountBalanceCopyWithImpl<$Res, AccountBalance>;
  @useResult
  $Res call({@JsonKey(name: 'account_id') String accountId, String balance});
}

/// @nodoc
class _$AccountBalanceCopyWithImpl<$Res, $Val extends AccountBalance>
    implements $AccountBalanceCopyWith<$Res> {
  _$AccountBalanceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountId = null,
    Object? balance = null,
  }) {
    return _then(_value.copyWith(
      accountId: null == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AccountBalanceCopyWith<$Res>
    implements $AccountBalanceCopyWith<$Res> {
  factory _$$_AccountBalanceCopyWith(
          _$_AccountBalance value, $Res Function(_$_AccountBalance) then) =
      __$$_AccountBalanceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'account_id') String accountId, String balance});
}

/// @nodoc
class __$$_AccountBalanceCopyWithImpl<$Res>
    extends _$AccountBalanceCopyWithImpl<$Res, _$_AccountBalance>
    implements _$$_AccountBalanceCopyWith<$Res> {
  __$$_AccountBalanceCopyWithImpl(
      _$_AccountBalance _value, $Res Function(_$_AccountBalance) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountId = null,
    Object? balance = null,
  }) {
    return _then(_$_AccountBalance(
      accountId: null == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AccountBalance implements _AccountBalance {
  const _$_AccountBalance(
      {@JsonKey(name: 'account_id') this.accountId = '', this.balance = ''});

  factory _$_AccountBalance.fromJson(Map<String, dynamic> json) =>
      _$$_AccountBalanceFromJson(json);

  @override
  @JsonKey(name: 'account_id')
  final String accountId;
  @override
  @JsonKey()
  final String balance;

  @override
  String toString() {
    return 'AccountBalance(accountId: $accountId, balance: $balance)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AccountBalance &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId) &&
            (identical(other.balance, balance) || other.balance == balance));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, accountId, balance);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AccountBalanceCopyWith<_$_AccountBalance> get copyWith =>
      __$$_AccountBalanceCopyWithImpl<_$_AccountBalance>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AccountBalanceToJson(
      this,
    );
  }
}

abstract class _AccountBalance implements AccountBalance {
  const factory _AccountBalance(
      {@JsonKey(name: 'account_id') final String accountId,
      final String balance}) = _$_AccountBalance;

  factory _AccountBalance.fromJson(Map<String, dynamic> json) =
      _$_AccountBalance.fromJson;

  @override
  @JsonKey(name: 'account_id')
  String get accountId;
  @override
  String get balance;
  @override
  @JsonKey(ignore: true)
  _$$_AccountBalanceCopyWith<_$_AccountBalance> get copyWith =>
      throw _privateConstructorUsedError;
}

AccountBalanceList _$AccountBalanceListFromJson(Map<String, dynamic> json) {
  return _AccountBalanceList.fromJson(json);
}

/// @nodoc
mixin _$AccountBalanceList {
  List<AccountBalance> get accountBalanceList =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountBalanceListCopyWith<AccountBalanceList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountBalanceListCopyWith<$Res> {
  factory $AccountBalanceListCopyWith(
          AccountBalanceList value, $Res Function(AccountBalanceList) then) =
      _$AccountBalanceListCopyWithImpl<$Res, AccountBalanceList>;
  @useResult
  $Res call({List<AccountBalance> accountBalanceList});
}

/// @nodoc
class _$AccountBalanceListCopyWithImpl<$Res, $Val extends AccountBalanceList>
    implements $AccountBalanceListCopyWith<$Res> {
  _$AccountBalanceListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountBalanceList = null,
  }) {
    return _then(_value.copyWith(
      accountBalanceList: null == accountBalanceList
          ? _value.accountBalanceList
          : accountBalanceList // ignore: cast_nullable_to_non_nullable
              as List<AccountBalance>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AccountBalanceListCopyWith<$Res>
    implements $AccountBalanceListCopyWith<$Res> {
  factory _$$_AccountBalanceListCopyWith(_$_AccountBalanceList value,
          $Res Function(_$_AccountBalanceList) then) =
      __$$_AccountBalanceListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<AccountBalance> accountBalanceList});
}

/// @nodoc
class __$$_AccountBalanceListCopyWithImpl<$Res>
    extends _$AccountBalanceListCopyWithImpl<$Res, _$_AccountBalanceList>
    implements _$$_AccountBalanceListCopyWith<$Res> {
  __$$_AccountBalanceListCopyWithImpl(
      _$_AccountBalanceList _value, $Res Function(_$_AccountBalanceList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountBalanceList = null,
  }) {
    return _then(_$_AccountBalanceList(
      accountBalanceList: null == accountBalanceList
          ? _value._accountBalanceList
          : accountBalanceList // ignore: cast_nullable_to_non_nullable
              as List<AccountBalance>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AccountBalanceList implements _AccountBalanceList {
  const _$_AccountBalanceList(
      {final List<AccountBalance> accountBalanceList = const []})
      : _accountBalanceList = accountBalanceList;

  factory _$_AccountBalanceList.fromJson(Map<String, dynamic> json) =>
      _$$_AccountBalanceListFromJson(json);

  final List<AccountBalance> _accountBalanceList;
  @override
  @JsonKey()
  List<AccountBalance> get accountBalanceList {
    if (_accountBalanceList is EqualUnmodifiableListView)
      return _accountBalanceList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_accountBalanceList);
  }

  @override
  String toString() {
    return 'AccountBalanceList(accountBalanceList: $accountBalanceList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AccountBalanceList &&
            const DeepCollectionEquality()
                .equals(other._accountBalanceList, _accountBalanceList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_accountBalanceList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AccountBalanceListCopyWith<_$_AccountBalanceList> get copyWith =>
      __$$_AccountBalanceListCopyWithImpl<_$_AccountBalanceList>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AccountBalanceListToJson(
      this,
    );
  }
}

abstract class _AccountBalanceList implements AccountBalanceList {
  const factory _AccountBalanceList(
      {final List<AccountBalance> accountBalanceList}) = _$_AccountBalanceList;

  factory _AccountBalanceList.fromJson(Map<String, dynamic> json) =
      _$_AccountBalanceList.fromJson;

  @override
  List<AccountBalance> get accountBalanceList;
  @override
  @JsonKey(ignore: true)
  _$$_AccountBalanceListCopyWith<_$_AccountBalanceList> get copyWith =>
      throw _privateConstructorUsedError;
}
