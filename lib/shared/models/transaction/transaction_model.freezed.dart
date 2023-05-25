// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Transaction _$TransactionFromJson(Map<String, dynamic> json) {
  return _Transaction.fromJson(json);
}

/// @nodoc
mixin _$Transaction {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'account_id')
  String get accountId => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionCopyWith<Transaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionCopyWith<$Res> {
  factory $TransactionCopyWith(
          Transaction value, $Res Function(Transaction) then) =
      _$TransactionCopyWithImpl<$Res, Transaction>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'account_id') String accountId,
      int amount,
      String type,
      String category,
      String description,
      String date});
}

/// @nodoc
class _$TransactionCopyWithImpl<$Res, $Val extends Transaction>
    implements $TransactionCopyWith<$Res> {
  _$TransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? accountId = null,
    Object? amount = null,
    Object? type = null,
    Object? category = null,
    Object? description = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      accountId: null == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TransactionCopyWith<$Res>
    implements $TransactionCopyWith<$Res> {
  factory _$$_TransactionCopyWith(
          _$_Transaction value, $Res Function(_$_Transaction) then) =
      __$$_TransactionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'account_id') String accountId,
      int amount,
      String type,
      String category,
      String description,
      String date});
}

/// @nodoc
class __$$_TransactionCopyWithImpl<$Res>
    extends _$TransactionCopyWithImpl<$Res, _$_Transaction>
    implements _$$_TransactionCopyWith<$Res> {
  __$$_TransactionCopyWithImpl(
      _$_Transaction _value, $Res Function(_$_Transaction) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? accountId = null,
    Object? amount = null,
    Object? type = null,
    Object? category = null,
    Object? description = null,
    Object? date = null,
  }) {
    return _then(_$_Transaction(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      accountId: null == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Transaction implements _Transaction {
  const _$_Transaction(
      {this.id = "",
      @JsonKey(name: 'account_id') this.accountId = "",
      this.amount = 0,
      this.type = "",
      this.category = "",
      this.description = "",
      this.date = ""});

  factory _$_Transaction.fromJson(Map<String, dynamic> json) =>
      _$$_TransactionFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey(name: 'account_id')
  final String accountId;
  @override
  @JsonKey()
  final int amount;
  @override
  @JsonKey()
  final String type;
  @override
  @JsonKey()
  final String category;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String date;

  @override
  String toString() {
    return 'Transaction(id: $id, accountId: $accountId, amount: $amount, type: $type, category: $category, description: $description, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Transaction &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, accountId, amount, type, category, description, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TransactionCopyWith<_$_Transaction> get copyWith =>
      __$$_TransactionCopyWithImpl<_$_Transaction>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransactionToJson(
      this,
    );
  }
}

abstract class _Transaction implements Transaction {
  const factory _Transaction(
      {final String id,
      @JsonKey(name: 'account_id') final String accountId,
      final int amount,
      final String type,
      final String category,
      final String description,
      final String date}) = _$_Transaction;

  factory _Transaction.fromJson(Map<String, dynamic> json) =
      _$_Transaction.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'account_id')
  String get accountId;
  @override
  int get amount;
  @override
  String get type;
  @override
  String get category;
  @override
  String get description;
  @override
  String get date;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionCopyWith<_$_Transaction> get copyWith =>
      throw _privateConstructorUsedError;
}

TransactionList _$TransactionListFromJson(Map<String, dynamic> json) {
  return _TransactionList.fromJson(json);
}

/// @nodoc
mixin _$TransactionList {
  List<Transaction> get transactionList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionListCopyWith<TransactionList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionListCopyWith<$Res> {
  factory $TransactionListCopyWith(
          TransactionList value, $Res Function(TransactionList) then) =
      _$TransactionListCopyWithImpl<$Res, TransactionList>;
  @useResult
  $Res call({List<Transaction> transactionList});
}

/// @nodoc
class _$TransactionListCopyWithImpl<$Res, $Val extends TransactionList>
    implements $TransactionListCopyWith<$Res> {
  _$TransactionListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionList = null,
  }) {
    return _then(_value.copyWith(
      transactionList: null == transactionList
          ? _value.transactionList
          : transactionList // ignore: cast_nullable_to_non_nullable
              as List<Transaction>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TransactionListCopyWith<$Res>
    implements $TransactionListCopyWith<$Res> {
  factory _$$_TransactionListCopyWith(
          _$_TransactionList value, $Res Function(_$_TransactionList) then) =
      __$$_TransactionListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Transaction> transactionList});
}

/// @nodoc
class __$$_TransactionListCopyWithImpl<$Res>
    extends _$TransactionListCopyWithImpl<$Res, _$_TransactionList>
    implements _$$_TransactionListCopyWith<$Res> {
  __$$_TransactionListCopyWithImpl(
      _$_TransactionList _value, $Res Function(_$_TransactionList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionList = null,
  }) {
    return _then(_$_TransactionList(
      transactionList: null == transactionList
          ? _value._transactionList
          : transactionList // ignore: cast_nullable_to_non_nullable
              as List<Transaction>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TransactionList implements _TransactionList {
  const _$_TransactionList({final List<Transaction> transactionList = const []})
      : _transactionList = transactionList;

  factory _$_TransactionList.fromJson(Map<String, dynamic> json) =>
      _$$_TransactionListFromJson(json);

  final List<Transaction> _transactionList;
  @override
  @JsonKey()
  List<Transaction> get transactionList {
    if (_transactionList is EqualUnmodifiableListView) return _transactionList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactionList);
  }

  @override
  String toString() {
    return 'TransactionList(transactionList: $transactionList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionList &&
            const DeepCollectionEquality()
                .equals(other._transactionList, _transactionList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_transactionList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TransactionListCopyWith<_$_TransactionList> get copyWith =>
      __$$_TransactionListCopyWithImpl<_$_TransactionList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransactionListToJson(
      this,
    );
  }
}

abstract class _TransactionList implements TransactionList {
  const factory _TransactionList({final List<Transaction> transactionList}) =
      _$_TransactionList;

  factory _TransactionList.fromJson(Map<String, dynamic> json) =
      _$_TransactionList.fromJson;

  @override
  List<Transaction> get transactionList;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionListCopyWith<_$_TransactionList> get copyWith =>
      throw _privateConstructorUsedError;
}
