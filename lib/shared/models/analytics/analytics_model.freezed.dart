// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'analytics_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Analytics _$AnalyticsFromJson(Map<String, dynamic> json) {
  return _Analytics.fromJson(json);
}

/// @nodoc
mixin _$Analytics {
  int get income => throw _privateConstructorUsedError;
  int get expenses => throw _privateConstructorUsedError;
  @JsonKey(name: 'account_balances')
  List<AccountBalance> get accountBalances =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnalyticsCopyWith<Analytics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalyticsCopyWith<$Res> {
  factory $AnalyticsCopyWith(Analytics value, $Res Function(Analytics) then) =
      _$AnalyticsCopyWithImpl<$Res, Analytics>;
  @useResult
  $Res call(
      {int income,
      int expenses,
      @JsonKey(name: 'account_balances') List<AccountBalance> accountBalances});
}

/// @nodoc
class _$AnalyticsCopyWithImpl<$Res, $Val extends Analytics>
    implements $AnalyticsCopyWith<$Res> {
  _$AnalyticsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? income = null,
    Object? expenses = null,
    Object? accountBalances = null,
  }) {
    return _then(_value.copyWith(
      income: null == income
          ? _value.income
          : income // ignore: cast_nullable_to_non_nullable
              as int,
      expenses: null == expenses
          ? _value.expenses
          : expenses // ignore: cast_nullable_to_non_nullable
              as int,
      accountBalances: null == accountBalances
          ? _value.accountBalances
          : accountBalances // ignore: cast_nullable_to_non_nullable
              as List<AccountBalance>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AnalyticsCopyWith<$Res> implements $AnalyticsCopyWith<$Res> {
  factory _$$_AnalyticsCopyWith(
          _$_Analytics value, $Res Function(_$_Analytics) then) =
      __$$_AnalyticsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int income,
      int expenses,
      @JsonKey(name: 'account_balances') List<AccountBalance> accountBalances});
}

/// @nodoc
class __$$_AnalyticsCopyWithImpl<$Res>
    extends _$AnalyticsCopyWithImpl<$Res, _$_Analytics>
    implements _$$_AnalyticsCopyWith<$Res> {
  __$$_AnalyticsCopyWithImpl(
      _$_Analytics _value, $Res Function(_$_Analytics) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? income = null,
    Object? expenses = null,
    Object? accountBalances = null,
  }) {
    return _then(_$_Analytics(
      income: null == income
          ? _value.income
          : income // ignore: cast_nullable_to_non_nullable
              as int,
      expenses: null == expenses
          ? _value.expenses
          : expenses // ignore: cast_nullable_to_non_nullable
              as int,
      accountBalances: null == accountBalances
          ? _value._accountBalances
          : accountBalances // ignore: cast_nullable_to_non_nullable
              as List<AccountBalance>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Analytics implements _Analytics {
  const _$_Analytics(
      {this.income = 0,
      this.expenses = 0,
      @JsonKey(name: 'account_balances')
          final List<AccountBalance> accountBalances = const []})
      : _accountBalances = accountBalances;

  factory _$_Analytics.fromJson(Map<String, dynamic> json) =>
      _$$_AnalyticsFromJson(json);

  @override
  @JsonKey()
  final int income;
  @override
  @JsonKey()
  final int expenses;
  final List<AccountBalance> _accountBalances;
  @override
  @JsonKey(name: 'account_balances')
  List<AccountBalance> get accountBalances {
    if (_accountBalances is EqualUnmodifiableListView) return _accountBalances;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_accountBalances);
  }

  @override
  String toString() {
    return 'Analytics(income: $income, expenses: $expenses, accountBalances: $accountBalances)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Analytics &&
            (identical(other.income, income) || other.income == income) &&
            (identical(other.expenses, expenses) ||
                other.expenses == expenses) &&
            const DeepCollectionEquality()
                .equals(other._accountBalances, _accountBalances));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, income, expenses,
      const DeepCollectionEquality().hash(_accountBalances));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AnalyticsCopyWith<_$_Analytics> get copyWith =>
      __$$_AnalyticsCopyWithImpl<_$_Analytics>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AnalyticsToJson(
      this,
    );
  }
}

abstract class _Analytics implements Analytics {
  const factory _Analytics(
      {final int income,
      final int expenses,
      @JsonKey(name: 'account_balances')
          final List<AccountBalance> accountBalances}) = _$_Analytics;

  factory _Analytics.fromJson(Map<String, dynamic> json) =
      _$_Analytics.fromJson;

  @override
  int get income;
  @override
  int get expenses;
  @override
  @JsonKey(name: 'account_balances')
  List<AccountBalance> get accountBalances;
  @override
  @JsonKey(ignore: true)
  _$$_AnalyticsCopyWith<_$_Analytics> get copyWith =>
      throw _privateConstructorUsedError;
}

AnalyticsList _$AnalyticsListFromJson(Map<String, dynamic> json) {
  return _AnalyticsList.fromJson(json);
}

/// @nodoc
mixin _$AnalyticsList {
  List<Analytics> get analyticsList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnalyticsListCopyWith<AnalyticsList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalyticsListCopyWith<$Res> {
  factory $AnalyticsListCopyWith(
          AnalyticsList value, $Res Function(AnalyticsList) then) =
      _$AnalyticsListCopyWithImpl<$Res, AnalyticsList>;
  @useResult
  $Res call({List<Analytics> analyticsList});
}

/// @nodoc
class _$AnalyticsListCopyWithImpl<$Res, $Val extends AnalyticsList>
    implements $AnalyticsListCopyWith<$Res> {
  _$AnalyticsListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? analyticsList = null,
  }) {
    return _then(_value.copyWith(
      analyticsList: null == analyticsList
          ? _value.analyticsList
          : analyticsList // ignore: cast_nullable_to_non_nullable
              as List<Analytics>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AnalyticsListCopyWith<$Res>
    implements $AnalyticsListCopyWith<$Res> {
  factory _$$_AnalyticsListCopyWith(
          _$_AnalyticsList value, $Res Function(_$_AnalyticsList) then) =
      __$$_AnalyticsListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Analytics> analyticsList});
}

/// @nodoc
class __$$_AnalyticsListCopyWithImpl<$Res>
    extends _$AnalyticsListCopyWithImpl<$Res, _$_AnalyticsList>
    implements _$$_AnalyticsListCopyWith<$Res> {
  __$$_AnalyticsListCopyWithImpl(
      _$_AnalyticsList _value, $Res Function(_$_AnalyticsList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? analyticsList = null,
  }) {
    return _then(_$_AnalyticsList(
      analyticsList: null == analyticsList
          ? _value._analyticsList
          : analyticsList // ignore: cast_nullable_to_non_nullable
              as List<Analytics>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AnalyticsList implements _AnalyticsList {
  const _$_AnalyticsList({final List<Analytics> analyticsList = const []})
      : _analyticsList = analyticsList;

  factory _$_AnalyticsList.fromJson(Map<String, dynamic> json) =>
      _$$_AnalyticsListFromJson(json);

  final List<Analytics> _analyticsList;
  @override
  @JsonKey()
  List<Analytics> get analyticsList {
    if (_analyticsList is EqualUnmodifiableListView) return _analyticsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_analyticsList);
  }

  @override
  String toString() {
    return 'AnalyticsList(analyticsList: $analyticsList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AnalyticsList &&
            const DeepCollectionEquality()
                .equals(other._analyticsList, _analyticsList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_analyticsList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AnalyticsListCopyWith<_$_AnalyticsList> get copyWith =>
      __$$_AnalyticsListCopyWithImpl<_$_AnalyticsList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AnalyticsListToJson(
      this,
    );
  }
}

abstract class _AnalyticsList implements AnalyticsList {
  const factory _AnalyticsList({final List<Analytics> analyticsList}) =
      _$_AnalyticsList;

  factory _AnalyticsList.fromJson(Map<String, dynamic> json) =
      _$_AnalyticsList.fromJson;

  @override
  List<Analytics> get analyticsList;
  @override
  @JsonKey(ignore: true)
  _$$_AnalyticsListCopyWith<_$_AnalyticsList> get copyWith =>
      throw _privateConstructorUsedError;
}
