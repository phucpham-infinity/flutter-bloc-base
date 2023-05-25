// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'accounting_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Accounting _$AccountingFromJson(Map<String, dynamic> json) {
  return _Accounting.fromJson(json);
}

/// @nodoc
mixin _$Accounting {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'expense_number')
  String get expenseNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'invoice_number')
  String get invoiceNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'vendor_id')
  String get vendorId => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_id')
  String get customerId => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'due_date')
  String get dueDate => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_amount')
  String get totalAmount => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountingCopyWith<Accounting> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountingCopyWith<$Res> {
  factory $AccountingCopyWith(
          Accounting value, $Res Function(Accounting) then) =
      _$AccountingCopyWithImpl<$Res, Accounting>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'expense_number') String expenseNumber,
      @JsonKey(name: 'invoice_number') String invoiceNumber,
      @JsonKey(name: 'vendor_id') String vendorId,
      @JsonKey(name: 'customer_id') String customerId,
      String date,
      @JsonKey(name: 'due_date') String dueDate,
      String status,
      @JsonKey(name: 'total_amount') String totalAmount,
      String currency});
}

/// @nodoc
class _$AccountingCopyWithImpl<$Res, $Val extends Accounting>
    implements $AccountingCopyWith<$Res> {
  _$AccountingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? expenseNumber = null,
    Object? invoiceNumber = null,
    Object? vendorId = null,
    Object? customerId = null,
    Object? date = null,
    Object? dueDate = null,
    Object? status = null,
    Object? totalAmount = null,
    Object? currency = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      expenseNumber: null == expenseNumber
          ? _value.expenseNumber
          : expenseNumber // ignore: cast_nullable_to_non_nullable
              as String,
      invoiceNumber: null == invoiceNumber
          ? _value.invoiceNumber
          : invoiceNumber // ignore: cast_nullable_to_non_nullable
              as String,
      vendorId: null == vendorId
          ? _value.vendorId
          : vendorId // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      dueDate: null == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AccountingCopyWith<$Res>
    implements $AccountingCopyWith<$Res> {
  factory _$$_AccountingCopyWith(
          _$_Accounting value, $Res Function(_$_Accounting) then) =
      __$$_AccountingCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'expense_number') String expenseNumber,
      @JsonKey(name: 'invoice_number') String invoiceNumber,
      @JsonKey(name: 'vendor_id') String vendorId,
      @JsonKey(name: 'customer_id') String customerId,
      String date,
      @JsonKey(name: 'due_date') String dueDate,
      String status,
      @JsonKey(name: 'total_amount') String totalAmount,
      String currency});
}

/// @nodoc
class __$$_AccountingCopyWithImpl<$Res>
    extends _$AccountingCopyWithImpl<$Res, _$_Accounting>
    implements _$$_AccountingCopyWith<$Res> {
  __$$_AccountingCopyWithImpl(
      _$_Accounting _value, $Res Function(_$_Accounting) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? expenseNumber = null,
    Object? invoiceNumber = null,
    Object? vendorId = null,
    Object? customerId = null,
    Object? date = null,
    Object? dueDate = null,
    Object? status = null,
    Object? totalAmount = null,
    Object? currency = null,
  }) {
    return _then(_$_Accounting(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      expenseNumber: null == expenseNumber
          ? _value.expenseNumber
          : expenseNumber // ignore: cast_nullable_to_non_nullable
              as String,
      invoiceNumber: null == invoiceNumber
          ? _value.invoiceNumber
          : invoiceNumber // ignore: cast_nullable_to_non_nullable
              as String,
      vendorId: null == vendorId
          ? _value.vendorId
          : vendorId // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      dueDate: null == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Accounting implements _Accounting {
  const _$_Accounting(
      {this.id = "",
      @JsonKey(name: 'expense_number') this.expenseNumber = "",
      @JsonKey(name: 'invoice_number') this.invoiceNumber = "",
      @JsonKey(name: 'vendor_id') this.vendorId = "",
      @JsonKey(name: 'customer_id') this.customerId = "",
      this.date = "",
      @JsonKey(name: 'due_date') this.dueDate = "",
      this.status = "",
      @JsonKey(name: 'total_amount') this.totalAmount = "",
      this.currency = ""});

  factory _$_Accounting.fromJson(Map<String, dynamic> json) =>
      _$$_AccountingFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey(name: 'expense_number')
  final String expenseNumber;
  @override
  @JsonKey(name: 'invoice_number')
  final String invoiceNumber;
  @override
  @JsonKey(name: 'vendor_id')
  final String vendorId;
  @override
  @JsonKey(name: 'customer_id')
  final String customerId;
  @override
  @JsonKey()
  final String date;
  @override
  @JsonKey(name: 'due_date')
  final String dueDate;
  @override
  @JsonKey()
  final String status;
  @override
  @JsonKey(name: 'total_amount')
  final String totalAmount;
  @override
  @JsonKey()
  final String currency;

  @override
  String toString() {
    return 'Accounting(id: $id, expenseNumber: $expenseNumber, invoiceNumber: $invoiceNumber, vendorId: $vendorId, customerId: $customerId, date: $date, dueDate: $dueDate, status: $status, totalAmount: $totalAmount, currency: $currency)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Accounting &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.expenseNumber, expenseNumber) ||
                other.expenseNumber == expenseNumber) &&
            (identical(other.invoiceNumber, invoiceNumber) ||
                other.invoiceNumber == invoiceNumber) &&
            (identical(other.vendorId, vendorId) ||
                other.vendorId == vendorId) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, expenseNumber, invoiceNumber,
      vendorId, customerId, date, dueDate, status, totalAmount, currency);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AccountingCopyWith<_$_Accounting> get copyWith =>
      __$$_AccountingCopyWithImpl<_$_Accounting>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AccountingToJson(
      this,
    );
  }
}

abstract class _Accounting implements Accounting {
  const factory _Accounting(
      {final String id,
      @JsonKey(name: 'expense_number') final String expenseNumber,
      @JsonKey(name: 'invoice_number') final String invoiceNumber,
      @JsonKey(name: 'vendor_id') final String vendorId,
      @JsonKey(name: 'customer_id') final String customerId,
      final String date,
      @JsonKey(name: 'due_date') final String dueDate,
      final String status,
      @JsonKey(name: 'total_amount') final String totalAmount,
      final String currency}) = _$_Accounting;

  factory _Accounting.fromJson(Map<String, dynamic> json) =
      _$_Accounting.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'expense_number')
  String get expenseNumber;
  @override
  @JsonKey(name: 'invoice_number')
  String get invoiceNumber;
  @override
  @JsonKey(name: 'vendor_id')
  String get vendorId;
  @override
  @JsonKey(name: 'customer_id')
  String get customerId;
  @override
  String get date;
  @override
  @JsonKey(name: 'due_date')
  String get dueDate;
  @override
  String get status;
  @override
  @JsonKey(name: 'total_amount')
  String get totalAmount;
  @override
  String get currency;
  @override
  @JsonKey(ignore: true)
  _$$_AccountingCopyWith<_$_Accounting> get copyWith =>
      throw _privateConstructorUsedError;
}

AccountingList _$AccountingListFromJson(Map<String, dynamic> json) {
  return _AccountingList.fromJson(json);
}

/// @nodoc
mixin _$AccountingList {
  List<Accounting> get accountingList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountingListCopyWith<AccountingList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountingListCopyWith<$Res> {
  factory $AccountingListCopyWith(
          AccountingList value, $Res Function(AccountingList) then) =
      _$AccountingListCopyWithImpl<$Res, AccountingList>;
  @useResult
  $Res call({List<Accounting> accountingList});
}

/// @nodoc
class _$AccountingListCopyWithImpl<$Res, $Val extends AccountingList>
    implements $AccountingListCopyWith<$Res> {
  _$AccountingListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountingList = null,
  }) {
    return _then(_value.copyWith(
      accountingList: null == accountingList
          ? _value.accountingList
          : accountingList // ignore: cast_nullable_to_non_nullable
              as List<Accounting>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AccountingListCopyWith<$Res>
    implements $AccountingListCopyWith<$Res> {
  factory _$$_AccountingListCopyWith(
          _$_AccountingList value, $Res Function(_$_AccountingList) then) =
      __$$_AccountingListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Accounting> accountingList});
}

/// @nodoc
class __$$_AccountingListCopyWithImpl<$Res>
    extends _$AccountingListCopyWithImpl<$Res, _$_AccountingList>
    implements _$$_AccountingListCopyWith<$Res> {
  __$$_AccountingListCopyWithImpl(
      _$_AccountingList _value, $Res Function(_$_AccountingList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountingList = null,
  }) {
    return _then(_$_AccountingList(
      accountingList: null == accountingList
          ? _value._accountingList
          : accountingList // ignore: cast_nullable_to_non_nullable
              as List<Accounting>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AccountingList implements _AccountingList {
  const _$_AccountingList({final List<Accounting> accountingList = const []})
      : _accountingList = accountingList;

  factory _$_AccountingList.fromJson(Map<String, dynamic> json) =>
      _$$_AccountingListFromJson(json);

  final List<Accounting> _accountingList;
  @override
  @JsonKey()
  List<Accounting> get accountingList {
    if (_accountingList is EqualUnmodifiableListView) return _accountingList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_accountingList);
  }

  @override
  String toString() {
    return 'AccountingList(accountingList: $accountingList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AccountingList &&
            const DeepCollectionEquality()
                .equals(other._accountingList, _accountingList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_accountingList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AccountingListCopyWith<_$_AccountingList> get copyWith =>
      __$$_AccountingListCopyWithImpl<_$_AccountingList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AccountingListToJson(
      this,
    );
  }
}

abstract class _AccountingList implements AccountingList {
  const factory _AccountingList({final List<Accounting> accountingList}) =
      _$_AccountingList;

  factory _AccountingList.fromJson(Map<String, dynamic> json) =
      _$_AccountingList.fromJson;

  @override
  List<Accounting> get accountingList;
  @override
  @JsonKey(ignore: true)
  _$$_AccountingListCopyWith<_$_AccountingList> get copyWith =>
      throw _privateConstructorUsedError;
}
