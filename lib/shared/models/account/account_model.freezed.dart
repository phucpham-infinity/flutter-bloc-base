// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Account _$AccountFromJson(Map<String, dynamic> json) {
  return _Account.fromJson(json);
}

/// @nodoc
mixin _$Account {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'account_name')
  String get accountName => throw _privateConstructorUsedError;
  @JsonKey(name: 'account_number')
  String get accountNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'balance')
  int get balance => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountCopyWith<Account> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountCopyWith<$Res> {
  factory $AccountCopyWith(Account value, $Res Function(Account) then) =
      _$AccountCopyWithImpl<$Res, Account>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'account_name') String accountName,
      @JsonKey(name: 'account_number') String accountNumber,
      @JsonKey(name: 'balance') int balance});
}

/// @nodoc
class _$AccountCopyWithImpl<$Res, $Val extends Account>
    implements $AccountCopyWith<$Res> {
  _$AccountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? accountName = null,
    Object? accountNumber = null,
    Object? balance = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      accountName: null == accountName
          ? _value.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String,
      accountNumber: null == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AccountCopyWith<$Res> implements $AccountCopyWith<$Res> {
  factory _$$_AccountCopyWith(
          _$_Account value, $Res Function(_$_Account) then) =
      __$$_AccountCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'account_name') String accountName,
      @JsonKey(name: 'account_number') String accountNumber,
      @JsonKey(name: 'balance') int balance});
}

/// @nodoc
class __$$_AccountCopyWithImpl<$Res>
    extends _$AccountCopyWithImpl<$Res, _$_Account>
    implements _$$_AccountCopyWith<$Res> {
  __$$_AccountCopyWithImpl(_$_Account _value, $Res Function(_$_Account) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? accountName = null,
    Object? accountNumber = null,
    Object? balance = null,
  }) {
    return _then(_$_Account(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      accountName: null == accountName
          ? _value.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String,
      accountNumber: null == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Account implements _Account {
  const _$_Account(
      {this.id = "",
      @JsonKey(name: 'account_name') this.accountName = "",
      @JsonKey(name: 'account_number') this.accountNumber = "",
      @JsonKey(name: 'balance') this.balance = ""});

  factory _$_Account.fromJson(Map<String, dynamic> json) =>
      _$$_AccountFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey(name: 'account_name')
  final String accountName;
  @override
  @JsonKey(name: 'account_number')
  final String accountNumber;
  @override
  @JsonKey(name: 'balance')
  final int balance;

  @override
  String toString() {
    return 'Account(id: $id, accountName: $accountName, accountNumber: $accountNumber, balance: $balance)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Account &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.accountName, accountName) ||
                other.accountName == accountName) &&
            (identical(other.accountNumber, accountNumber) ||
                other.accountNumber == accountNumber) &&
            (identical(other.balance, balance) || other.balance == balance));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, accountName, accountNumber, balance);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AccountCopyWith<_$_Account> get copyWith =>
      __$$_AccountCopyWithImpl<_$_Account>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AccountToJson(
      this,
    );
  }
}

abstract class _Account implements Account {
  const factory _Account(
      {final String id,
      @JsonKey(name: 'account_name') final String accountName,
      @JsonKey(name: 'account_number') final String accountNumber,
      @JsonKey(name: 'balance') final int balance}) = _$_Account;

  factory _Account.fromJson(Map<String, dynamic> json) = _$_Account.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'account_name')
  String get accountName;
  @override
  @JsonKey(name: 'account_number')
  String get accountNumber;
  @override
  @JsonKey(name: 'balance')
  int get balance;
  @override
  @JsonKey(ignore: true)
  _$$_AccountCopyWith<_$_Account> get copyWith =>
      throw _privateConstructorUsedError;
}

AccountList _$AccountListFromJson(Map<String, dynamic> json) {
  return _AccountList.fromJson(json);
}

/// @nodoc
mixin _$AccountList {
  List<Account> get accountList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountListCopyWith<AccountList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountListCopyWith<$Res> {
  factory $AccountListCopyWith(
          AccountList value, $Res Function(AccountList) then) =
      _$AccountListCopyWithImpl<$Res, AccountList>;
  @useResult
  $Res call({List<Account> accountList});
}

/// @nodoc
class _$AccountListCopyWithImpl<$Res, $Val extends AccountList>
    implements $AccountListCopyWith<$Res> {
  _$AccountListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountList = null,
  }) {
    return _then(_value.copyWith(
      accountList: null == accountList
          ? _value.accountList
          : accountList // ignore: cast_nullable_to_non_nullable
              as List<Account>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AccountListCopyWith<$Res>
    implements $AccountListCopyWith<$Res> {
  factory _$$_AccountListCopyWith(
          _$_AccountList value, $Res Function(_$_AccountList) then) =
      __$$_AccountListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Account> accountList});
}

/// @nodoc
class __$$_AccountListCopyWithImpl<$Res>
    extends _$AccountListCopyWithImpl<$Res, _$_AccountList>
    implements _$$_AccountListCopyWith<$Res> {
  __$$_AccountListCopyWithImpl(
      _$_AccountList _value, $Res Function(_$_AccountList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountList = null,
  }) {
    return _then(_$_AccountList(
      accountList: null == accountList
          ? _value._accountList
          : accountList // ignore: cast_nullable_to_non_nullable
              as List<Account>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AccountList implements _AccountList {
  const _$_AccountList({final List<Account> accountList = const []})
      : _accountList = accountList;

  factory _$_AccountList.fromJson(Map<String, dynamic> json) =>
      _$$_AccountListFromJson(json);

  final List<Account> _accountList;
  @override
  @JsonKey()
  List<Account> get accountList {
    if (_accountList is EqualUnmodifiableListView) return _accountList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_accountList);
  }

  @override
  String toString() {
    return 'AccountList(accountList: $accountList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AccountList &&
            const DeepCollectionEquality()
                .equals(other._accountList, _accountList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_accountList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AccountListCopyWith<_$_AccountList> get copyWith =>
      __$$_AccountListCopyWithImpl<_$_AccountList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AccountListToJson(
      this,
    );
  }
}

abstract class _AccountList implements AccountList {
  const factory _AccountList({final List<Account> accountList}) =
      _$_AccountList;

  factory _AccountList.fromJson(Map<String, dynamic> json) =
      _$_AccountList.fromJson;

  @override
  List<Account> get accountList;
  @override
  @JsonKey(ignore: true)
  _$$_AccountListCopyWith<_$_AccountList> get copyWith =>
      throw _privateConstructorUsedError;
}
