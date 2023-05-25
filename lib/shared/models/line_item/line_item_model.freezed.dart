// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'line_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LineItem _$LineItemFromJson(Map<String, dynamic> json) {
  return _LineItem.fromJson(json);
}

/// @nodoc
mixin _$LineItem {
  int get quantity => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'unit_price')
  int get unitPrice => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LineItemCopyWith<LineItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LineItemCopyWith<$Res> {
  factory $LineItemCopyWith(LineItem value, $Res Function(LineItem) then) =
      _$LineItemCopyWithImpl<$Res, LineItem>;
  @useResult
  $Res call(
      {int quantity,
      String description,
      @JsonKey(name: 'unit_price') int unitPrice});
}

/// @nodoc
class _$LineItemCopyWithImpl<$Res, $Val extends LineItem>
    implements $LineItemCopyWith<$Res> {
  _$LineItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quantity = null,
    Object? description = null,
    Object? unitPrice = null,
  }) {
    return _then(_value.copyWith(
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      unitPrice: null == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LineItemCopyWith<$Res> implements $LineItemCopyWith<$Res> {
  factory _$$_LineItemCopyWith(
          _$_LineItem value, $Res Function(_$_LineItem) then) =
      __$$_LineItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int quantity,
      String description,
      @JsonKey(name: 'unit_price') int unitPrice});
}

/// @nodoc
class __$$_LineItemCopyWithImpl<$Res>
    extends _$LineItemCopyWithImpl<$Res, _$_LineItem>
    implements _$$_LineItemCopyWith<$Res> {
  __$$_LineItemCopyWithImpl(
      _$_LineItem _value, $Res Function(_$_LineItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quantity = null,
    Object? description = null,
    Object? unitPrice = null,
  }) {
    return _then(_$_LineItem(
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      unitPrice: null == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LineItem implements _LineItem {
  const _$_LineItem(
      {this.quantity = 0,
      this.description = "",
      @JsonKey(name: 'unit_price') this.unitPrice = ""});

  factory _$_LineItem.fromJson(Map<String, dynamic> json) =>
      _$$_LineItemFromJson(json);

  @override
  @JsonKey()
  final int quantity;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey(name: 'unit_price')
  final int unitPrice;

  @override
  String toString() {
    return 'LineItem(quantity: $quantity, description: $description, unitPrice: $unitPrice)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LineItem &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, quantity, description, unitPrice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LineItemCopyWith<_$_LineItem> get copyWith =>
      __$$_LineItemCopyWithImpl<_$_LineItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LineItemToJson(
      this,
    );
  }
}

abstract class _LineItem implements LineItem {
  const factory _LineItem(
      {final int quantity,
      final String description,
      @JsonKey(name: 'unit_price') final int unitPrice}) = _$_LineItem;

  factory _LineItem.fromJson(Map<String, dynamic> json) = _$_LineItem.fromJson;

  @override
  int get quantity;
  @override
  String get description;
  @override
  @JsonKey(name: 'unit_price')
  int get unitPrice;
  @override
  @JsonKey(ignore: true)
  _$$_LineItemCopyWith<_$_LineItem> get copyWith =>
      throw _privateConstructorUsedError;
}

LineItemList _$LineItemListFromJson(Map<String, dynamic> json) {
  return _LineItemList.fromJson(json);
}

/// @nodoc
mixin _$LineItemList {
  List<LineItem> get lineItemList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LineItemListCopyWith<LineItemList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LineItemListCopyWith<$Res> {
  factory $LineItemListCopyWith(
          LineItemList value, $Res Function(LineItemList) then) =
      _$LineItemListCopyWithImpl<$Res, LineItemList>;
  @useResult
  $Res call({List<LineItem> lineItemList});
}

/// @nodoc
class _$LineItemListCopyWithImpl<$Res, $Val extends LineItemList>
    implements $LineItemListCopyWith<$Res> {
  _$LineItemListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lineItemList = null,
  }) {
    return _then(_value.copyWith(
      lineItemList: null == lineItemList
          ? _value.lineItemList
          : lineItemList // ignore: cast_nullable_to_non_nullable
              as List<LineItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LineItemListCopyWith<$Res>
    implements $LineItemListCopyWith<$Res> {
  factory _$$_LineItemListCopyWith(
          _$_LineItemList value, $Res Function(_$_LineItemList) then) =
      __$$_LineItemListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<LineItem> lineItemList});
}

/// @nodoc
class __$$_LineItemListCopyWithImpl<$Res>
    extends _$LineItemListCopyWithImpl<$Res, _$_LineItemList>
    implements _$$_LineItemListCopyWith<$Res> {
  __$$_LineItemListCopyWithImpl(
      _$_LineItemList _value, $Res Function(_$_LineItemList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lineItemList = null,
  }) {
    return _then(_$_LineItemList(
      lineItemList: null == lineItemList
          ? _value._lineItemList
          : lineItemList // ignore: cast_nullable_to_non_nullable
              as List<LineItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LineItemList implements _LineItemList {
  const _$_LineItemList({final List<LineItem> lineItemList = const []})
      : _lineItemList = lineItemList;

  factory _$_LineItemList.fromJson(Map<String, dynamic> json) =>
      _$$_LineItemListFromJson(json);

  final List<LineItem> _lineItemList;
  @override
  @JsonKey()
  List<LineItem> get lineItemList {
    if (_lineItemList is EqualUnmodifiableListView) return _lineItemList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lineItemList);
  }

  @override
  String toString() {
    return 'LineItemList(lineItemList: $lineItemList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LineItemList &&
            const DeepCollectionEquality()
                .equals(other._lineItemList, _lineItemList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_lineItemList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LineItemListCopyWith<_$_LineItemList> get copyWith =>
      __$$_LineItemListCopyWithImpl<_$_LineItemList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LineItemListToJson(
      this,
    );
  }
}

abstract class _LineItemList implements LineItemList {
  const factory _LineItemList({final List<LineItem> lineItemList}) =
      _$_LineItemList;

  factory _LineItemList.fromJson(Map<String, dynamic> json) =
      _$_LineItemList.fromJson;

  @override
  List<LineItem> get lineItemList;
  @override
  @JsonKey(ignore: true)
  _$$_LineItemListCopyWith<_$_LineItemList> get copyWith =>
      throw _privateConstructorUsedError;
}
