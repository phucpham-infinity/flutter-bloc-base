// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransactionHistory _$TransactionHistoryFromJson(Map<String, dynamic> json) {
  return _TransactionHistory.fromJson(json);
}

/// @nodoc
mixin _$TransactionHistory {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'account_id')
  String get accountId => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_type')
  String get transactionType => throw _privateConstructorUsedError;
  String get amount => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get subcategory => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionHistoryCopyWith<TransactionHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionHistoryCopyWith<$Res> {
  factory $TransactionHistoryCopyWith(
          TransactionHistory value, $Res Function(TransactionHistory) then) =
      _$TransactionHistoryCopyWithImpl<$Res, TransactionHistory>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'account_id') String accountId,
      @JsonKey(name: 'transaction_type') String transactionType,
      String amount,
      String currency,
      String description,
      String date,
      String category,
      String subcategory});
}

/// @nodoc
class _$TransactionHistoryCopyWithImpl<$Res, $Val extends TransactionHistory>
    implements $TransactionHistoryCopyWith<$Res> {
  _$TransactionHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? accountId = null,
    Object? transactionType = null,
    Object? amount = null,
    Object? currency = null,
    Object? description = null,
    Object? date = null,
    Object? category = null,
    Object? subcategory = null,
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
      transactionType: null == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      subcategory: null == subcategory
          ? _value.subcategory
          : subcategory // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TransactionHistoryCopyWith<$Res>
    implements $TransactionHistoryCopyWith<$Res> {
  factory _$$_TransactionHistoryCopyWith(_$_TransactionHistory value,
          $Res Function(_$_TransactionHistory) then) =
      __$$_TransactionHistoryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'account_id') String accountId,
      @JsonKey(name: 'transaction_type') String transactionType,
      String amount,
      String currency,
      String description,
      String date,
      String category,
      String subcategory});
}

/// @nodoc
class __$$_TransactionHistoryCopyWithImpl<$Res>
    extends _$TransactionHistoryCopyWithImpl<$Res, _$_TransactionHistory>
    implements _$$_TransactionHistoryCopyWith<$Res> {
  __$$_TransactionHistoryCopyWithImpl(
      _$_TransactionHistory _value, $Res Function(_$_TransactionHistory) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? accountId = null,
    Object? transactionType = null,
    Object? amount = null,
    Object? currency = null,
    Object? description = null,
    Object? date = null,
    Object? category = null,
    Object? subcategory = null,
  }) {
    return _then(_$_TransactionHistory(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      accountId: null == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as String,
      transactionType: null == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      subcategory: null == subcategory
          ? _value.subcategory
          : subcategory // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TransactionHistory implements _TransactionHistory {
  const _$_TransactionHistory(
      {this.id = "",
      @JsonKey(name: 'account_id') this.accountId = "",
      @JsonKey(name: 'transaction_type') this.transactionType = "",
      this.amount = "",
      this.currency = "",
      this.description = "",
      this.date = "",
      this.category = "",
      this.subcategory = ""});

  factory _$_TransactionHistory.fromJson(Map<String, dynamic> json) =>
      _$$_TransactionHistoryFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey(name: 'account_id')
  final String accountId;
  @override
  @JsonKey(name: 'transaction_type')
  final String transactionType;
  @override
  @JsonKey()
  final String amount;
  @override
  @JsonKey()
  final String currency;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String date;
  @override
  @JsonKey()
  final String category;
  @override
  @JsonKey()
  final String subcategory;

  @override
  String toString() {
    return 'TransactionHistory(id: $id, accountId: $accountId, transactionType: $transactionType, amount: $amount, currency: $currency, description: $description, date: $date, category: $category, subcategory: $subcategory)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionHistory &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId) &&
            (identical(other.transactionType, transactionType) ||
                other.transactionType == transactionType) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.subcategory, subcategory) ||
                other.subcategory == subcategory));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, accountId, transactionType,
      amount, currency, description, date, category, subcategory);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TransactionHistoryCopyWith<_$_TransactionHistory> get copyWith =>
      __$$_TransactionHistoryCopyWithImpl<_$_TransactionHistory>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransactionHistoryToJson(
      this,
    );
  }
}

abstract class _TransactionHistory implements TransactionHistory {
  const factory _TransactionHistory(
      {final String id,
      @JsonKey(name: 'account_id') final String accountId,
      @JsonKey(name: 'transaction_type') final String transactionType,
      final String amount,
      final String currency,
      final String description,
      final String date,
      final String category,
      final String subcategory}) = _$_TransactionHistory;

  factory _TransactionHistory.fromJson(Map<String, dynamic> json) =
      _$_TransactionHistory.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'account_id')
  String get accountId;
  @override
  @JsonKey(name: 'transaction_type')
  String get transactionType;
  @override
  String get amount;
  @override
  String get currency;
  @override
  String get description;
  @override
  String get date;
  @override
  String get category;
  @override
  String get subcategory;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionHistoryCopyWith<_$_TransactionHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

TransactionHistoryList _$TransactionHistoryListFromJson(
    Map<String, dynamic> json) {
  return _TransactionHistoryList.fromJson(json);
}

/// @nodoc
mixin _$TransactionHistoryList {
  List<TransactionHistory> get transactionHistoryList =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionHistoryListCopyWith<TransactionHistoryList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionHistoryListCopyWith<$Res> {
  factory $TransactionHistoryListCopyWith(TransactionHistoryList value,
          $Res Function(TransactionHistoryList) then) =
      _$TransactionHistoryListCopyWithImpl<$Res, TransactionHistoryList>;
  @useResult
  $Res call({List<TransactionHistory> transactionHistoryList});
}

/// @nodoc
class _$TransactionHistoryListCopyWithImpl<$Res,
        $Val extends TransactionHistoryList>
    implements $TransactionHistoryListCopyWith<$Res> {
  _$TransactionHistoryListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionHistoryList = null,
  }) {
    return _then(_value.copyWith(
      transactionHistoryList: null == transactionHistoryList
          ? _value.transactionHistoryList
          : transactionHistoryList // ignore: cast_nullable_to_non_nullable
              as List<TransactionHistory>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TransactionHistoryListCopyWith<$Res>
    implements $TransactionHistoryListCopyWith<$Res> {
  factory _$$_TransactionHistoryListCopyWith(_$_TransactionHistoryList value,
          $Res Function(_$_TransactionHistoryList) then) =
      __$$_TransactionHistoryListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TransactionHistory> transactionHistoryList});
}

/// @nodoc
class __$$_TransactionHistoryListCopyWithImpl<$Res>
    extends _$TransactionHistoryListCopyWithImpl<$Res,
        _$_TransactionHistoryList>
    implements _$$_TransactionHistoryListCopyWith<$Res> {
  __$$_TransactionHistoryListCopyWithImpl(_$_TransactionHistoryList _value,
      $Res Function(_$_TransactionHistoryList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionHistoryList = null,
  }) {
    return _then(_$_TransactionHistoryList(
      transactionHistoryList: null == transactionHistoryList
          ? _value._transactionHistoryList
          : transactionHistoryList // ignore: cast_nullable_to_non_nullable
              as List<TransactionHistory>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TransactionHistoryList implements _TransactionHistoryList {
  const _$_TransactionHistoryList(
      {final List<TransactionHistory> transactionHistoryList = const []})
      : _transactionHistoryList = transactionHistoryList;

  factory _$_TransactionHistoryList.fromJson(Map<String, dynamic> json) =>
      _$$_TransactionHistoryListFromJson(json);

  final List<TransactionHistory> _transactionHistoryList;
  @override
  @JsonKey()
  List<TransactionHistory> get transactionHistoryList {
    if (_transactionHistoryList is EqualUnmodifiableListView)
      return _transactionHistoryList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactionHistoryList);
  }

  @override
  String toString() {
    return 'TransactionHistoryList(transactionHistoryList: $transactionHistoryList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionHistoryList &&
            const DeepCollectionEquality().equals(
                other._transactionHistoryList, _transactionHistoryList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_transactionHistoryList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TransactionHistoryListCopyWith<_$_TransactionHistoryList> get copyWith =>
      __$$_TransactionHistoryListCopyWithImpl<_$_TransactionHistoryList>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransactionHistoryListToJson(
      this,
    );
  }
}

abstract class _TransactionHistoryList implements TransactionHistoryList {
  const factory _TransactionHistoryList(
          {final List<TransactionHistory> transactionHistoryList}) =
      _$_TransactionHistoryList;

  factory _TransactionHistoryList.fromJson(Map<String, dynamic> json) =
      _$_TransactionHistoryList.fromJson;

  @override
  List<TransactionHistory> get transactionHistoryList;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionHistoryListCopyWith<_$_TransactionHistoryList> get copyWith =>
      throw _privateConstructorUsedError;
}
