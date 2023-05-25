// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'marketplace_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Marketplace _$MarketplaceFromJson(Map<String, dynamic> json) {
  return _Marketplace.fromJson(json);
}

/// @nodoc
mixin _$Marketplace {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MarketplaceCopyWith<Marketplace> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarketplaceCopyWith<$Res> {
  factory $MarketplaceCopyWith(
          Marketplace value, $Res Function(Marketplace) then) =
      _$MarketplaceCopyWithImpl<$Res, Marketplace>;
  @useResult
  $Res call(
      {String id, String name, String description, int price, String currency});
}

/// @nodoc
class _$MarketplaceCopyWithImpl<$Res, $Val extends Marketplace>
    implements $MarketplaceCopyWith<$Res> {
  _$MarketplaceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? price = null,
    Object? currency = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MarketplaceCopyWith<$Res>
    implements $MarketplaceCopyWith<$Res> {
  factory _$$_MarketplaceCopyWith(
          _$_Marketplace value, $Res Function(_$_Marketplace) then) =
      __$$_MarketplaceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, String name, String description, int price, String currency});
}

/// @nodoc
class __$$_MarketplaceCopyWithImpl<$Res>
    extends _$MarketplaceCopyWithImpl<$Res, _$_Marketplace>
    implements _$$_MarketplaceCopyWith<$Res> {
  __$$_MarketplaceCopyWithImpl(
      _$_Marketplace _value, $Res Function(_$_Marketplace) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? price = null,
    Object? currency = null,
  }) {
    return _then(_$_Marketplace(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Marketplace implements _Marketplace {
  const _$_Marketplace(
      {this.id = "",
      this.name = "",
      this.description = "",
      this.price = 0,
      this.currency = ""});

  factory _$_Marketplace.fromJson(Map<String, dynamic> json) =>
      _$$_MarketplaceFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final int price;
  @override
  @JsonKey()
  final String currency;

  @override
  String toString() {
    return 'Marketplace(id: $id, name: $name, description: $description, price: $price, currency: $currency)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Marketplace &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, description, price, currency);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MarketplaceCopyWith<_$_Marketplace> get copyWith =>
      __$$_MarketplaceCopyWithImpl<_$_Marketplace>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MarketplaceToJson(
      this,
    );
  }
}

abstract class _Marketplace implements Marketplace {
  const factory _Marketplace(
      {final String id,
      final String name,
      final String description,
      final int price,
      final String currency}) = _$_Marketplace;

  factory _Marketplace.fromJson(Map<String, dynamic> json) =
      _$_Marketplace.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  int get price;
  @override
  String get currency;
  @override
  @JsonKey(ignore: true)
  _$$_MarketplaceCopyWith<_$_Marketplace> get copyWith =>
      throw _privateConstructorUsedError;
}

MarketplaceList _$MarketplaceListFromJson(Map<String, dynamic> json) {
  return _MarketplaceList.fromJson(json);
}

/// @nodoc
mixin _$MarketplaceList {
  List<Marketplace> get marketplaceList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MarketplaceListCopyWith<MarketplaceList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarketplaceListCopyWith<$Res> {
  factory $MarketplaceListCopyWith(
          MarketplaceList value, $Res Function(MarketplaceList) then) =
      _$MarketplaceListCopyWithImpl<$Res, MarketplaceList>;
  @useResult
  $Res call({List<Marketplace> marketplaceList});
}

/// @nodoc
class _$MarketplaceListCopyWithImpl<$Res, $Val extends MarketplaceList>
    implements $MarketplaceListCopyWith<$Res> {
  _$MarketplaceListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? marketplaceList = null,
  }) {
    return _then(_value.copyWith(
      marketplaceList: null == marketplaceList
          ? _value.marketplaceList
          : marketplaceList // ignore: cast_nullable_to_non_nullable
              as List<Marketplace>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MarketplaceListCopyWith<$Res>
    implements $MarketplaceListCopyWith<$Res> {
  factory _$$_MarketplaceListCopyWith(
          _$_MarketplaceList value, $Res Function(_$_MarketplaceList) then) =
      __$$_MarketplaceListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Marketplace> marketplaceList});
}

/// @nodoc
class __$$_MarketplaceListCopyWithImpl<$Res>
    extends _$MarketplaceListCopyWithImpl<$Res, _$_MarketplaceList>
    implements _$$_MarketplaceListCopyWith<$Res> {
  __$$_MarketplaceListCopyWithImpl(
      _$_MarketplaceList _value, $Res Function(_$_MarketplaceList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? marketplaceList = null,
  }) {
    return _then(_$_MarketplaceList(
      marketplaceList: null == marketplaceList
          ? _value._marketplaceList
          : marketplaceList // ignore: cast_nullable_to_non_nullable
              as List<Marketplace>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MarketplaceList implements _MarketplaceList {
  const _$_MarketplaceList({final List<Marketplace> marketplaceList = const []})
      : _marketplaceList = marketplaceList;

  factory _$_MarketplaceList.fromJson(Map<String, dynamic> json) =>
      _$$_MarketplaceListFromJson(json);

  final List<Marketplace> _marketplaceList;
  @override
  @JsonKey()
  List<Marketplace> get marketplaceList {
    if (_marketplaceList is EqualUnmodifiableListView) return _marketplaceList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_marketplaceList);
  }

  @override
  String toString() {
    return 'MarketplaceList(marketplaceList: $marketplaceList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MarketplaceList &&
            const DeepCollectionEquality()
                .equals(other._marketplaceList, _marketplaceList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_marketplaceList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MarketplaceListCopyWith<_$_MarketplaceList> get copyWith =>
      __$$_MarketplaceListCopyWithImpl<_$_MarketplaceList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MarketplaceListToJson(
      this,
    );
  }
}

abstract class _MarketplaceList implements MarketplaceList {
  const factory _MarketplaceList({final List<Marketplace> marketplaceList}) =
      _$_MarketplaceList;

  factory _MarketplaceList.fromJson(Map<String, dynamic> json) =
      _$_MarketplaceList.fromJson;

  @override
  List<Marketplace> get marketplaceList;
  @override
  @JsonKey(ignore: true)
  _$$_MarketplaceListCopyWith<_$_MarketplaceList> get copyWith =>
      throw _privateConstructorUsedError;
}
