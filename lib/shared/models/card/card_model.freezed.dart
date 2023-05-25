// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Card _$CardFromJson(Map<String, dynamic> json) {
  return _Card.fromJson(json);
}

/// @nodoc
mixin _$Card {
  @JsonKey(name: 'card_id')
  String get cardId => throw _privateConstructorUsedError;
  @JsonKey(name: 'card_type')
  String get cardType => throw _privateConstructorUsedError;
  @JsonKey(name: 'card_nickname')
  String get cardNickname => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CardCopyWith<Card> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardCopyWith<$Res> {
  factory $CardCopyWith(Card value, $Res Function(Card) then) =
      _$CardCopyWithImpl<$Res, Card>;
  @useResult
  $Res call(
      {@JsonKey(name: 'card_id') String cardId,
      @JsonKey(name: 'card_type') String cardType,
      @JsonKey(name: 'card_nickname') String cardNickname,
      String status});
}

/// @nodoc
class _$CardCopyWithImpl<$Res, $Val extends Card>
    implements $CardCopyWith<$Res> {
  _$CardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardId = null,
    Object? cardType = null,
    Object? cardNickname = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      cardId: null == cardId
          ? _value.cardId
          : cardId // ignore: cast_nullable_to_non_nullable
              as String,
      cardType: null == cardType
          ? _value.cardType
          : cardType // ignore: cast_nullable_to_non_nullable
              as String,
      cardNickname: null == cardNickname
          ? _value.cardNickname
          : cardNickname // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CardCopyWith<$Res> implements $CardCopyWith<$Res> {
  factory _$$_CardCopyWith(_$_Card value, $Res Function(_$_Card) then) =
      __$$_CardCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'card_id') String cardId,
      @JsonKey(name: 'card_type') String cardType,
      @JsonKey(name: 'card_nickname') String cardNickname,
      String status});
}

/// @nodoc
class __$$_CardCopyWithImpl<$Res> extends _$CardCopyWithImpl<$Res, _$_Card>
    implements _$$_CardCopyWith<$Res> {
  __$$_CardCopyWithImpl(_$_Card _value, $Res Function(_$_Card) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardId = null,
    Object? cardType = null,
    Object? cardNickname = null,
    Object? status = null,
  }) {
    return _then(_$_Card(
      cardId: null == cardId
          ? _value.cardId
          : cardId // ignore: cast_nullable_to_non_nullable
              as String,
      cardType: null == cardType
          ? _value.cardType
          : cardType // ignore: cast_nullable_to_non_nullable
              as String,
      cardNickname: null == cardNickname
          ? _value.cardNickname
          : cardNickname // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Card implements _Card {
  const _$_Card(
      {@JsonKey(name: 'card_id') this.cardId = '',
      @JsonKey(name: 'card_type') this.cardType = '',
      @JsonKey(name: 'card_nickname') this.cardNickname = '',
      this.status = ''});

  factory _$_Card.fromJson(Map<String, dynamic> json) => _$$_CardFromJson(json);

  @override
  @JsonKey(name: 'card_id')
  final String cardId;
  @override
  @JsonKey(name: 'card_type')
  final String cardType;
  @override
  @JsonKey(name: 'card_nickname')
  final String cardNickname;
  @override
  @JsonKey()
  final String status;

  @override
  String toString() {
    return 'Card(cardId: $cardId, cardType: $cardType, cardNickname: $cardNickname, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Card &&
            (identical(other.cardId, cardId) || other.cardId == cardId) &&
            (identical(other.cardType, cardType) ||
                other.cardType == cardType) &&
            (identical(other.cardNickname, cardNickname) ||
                other.cardNickname == cardNickname) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, cardId, cardType, cardNickname, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CardCopyWith<_$_Card> get copyWith =>
      __$$_CardCopyWithImpl<_$_Card>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CardToJson(
      this,
    );
  }
}

abstract class _Card implements Card {
  const factory _Card(
      {@JsonKey(name: 'card_id') final String cardId,
      @JsonKey(name: 'card_type') final String cardType,
      @JsonKey(name: 'card_nickname') final String cardNickname,
      final String status}) = _$_Card;

  factory _Card.fromJson(Map<String, dynamic> json) = _$_Card.fromJson;

  @override
  @JsonKey(name: 'card_id')
  String get cardId;
  @override
  @JsonKey(name: 'card_type')
  String get cardType;
  @override
  @JsonKey(name: 'card_nickname')
  String get cardNickname;
  @override
  String get status;
  @override
  @JsonKey(ignore: true)
  _$$_CardCopyWith<_$_Card> get copyWith => throw _privateConstructorUsedError;
}

CardList _$CardListFromJson(Map<String, dynamic> json) {
  return _CardList.fromJson(json);
}

/// @nodoc
mixin _$CardList {
  List<Card> get cardList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CardListCopyWith<CardList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardListCopyWith<$Res> {
  factory $CardListCopyWith(CardList value, $Res Function(CardList) then) =
      _$CardListCopyWithImpl<$Res, CardList>;
  @useResult
  $Res call({List<Card> cardList});
}

/// @nodoc
class _$CardListCopyWithImpl<$Res, $Val extends CardList>
    implements $CardListCopyWith<$Res> {
  _$CardListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardList = null,
  }) {
    return _then(_value.copyWith(
      cardList: null == cardList
          ? _value.cardList
          : cardList // ignore: cast_nullable_to_non_nullable
              as List<Card>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CardListCopyWith<$Res> implements $CardListCopyWith<$Res> {
  factory _$$_CardListCopyWith(
          _$_CardList value, $Res Function(_$_CardList) then) =
      __$$_CardListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Card> cardList});
}

/// @nodoc
class __$$_CardListCopyWithImpl<$Res>
    extends _$CardListCopyWithImpl<$Res, _$_CardList>
    implements _$$_CardListCopyWith<$Res> {
  __$$_CardListCopyWithImpl(
      _$_CardList _value, $Res Function(_$_CardList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardList = null,
  }) {
    return _then(_$_CardList(
      cardList: null == cardList
          ? _value._cardList
          : cardList // ignore: cast_nullable_to_non_nullable
              as List<Card>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CardList implements _CardList {
  const _$_CardList({final List<Card> cardList = const []})
      : _cardList = cardList;

  factory _$_CardList.fromJson(Map<String, dynamic> json) =>
      _$$_CardListFromJson(json);

  final List<Card> _cardList;
  @override
  @JsonKey()
  List<Card> get cardList {
    if (_cardList is EqualUnmodifiableListView) return _cardList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cardList);
  }

  @override
  String toString() {
    return 'CardList(cardList: $cardList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CardList &&
            const DeepCollectionEquality().equals(other._cardList, _cardList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_cardList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CardListCopyWith<_$_CardList> get copyWith =>
      __$$_CardListCopyWithImpl<_$_CardList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CardListToJson(
      this,
    );
  }
}

abstract class _CardList implements CardList {
  const factory _CardList({final List<Card> cardList}) = _$_CardList;

  factory _CardList.fromJson(Map<String, dynamic> json) = _$_CardList.fromJson;

  @override
  List<Card> get cardList;
  @override
  @JsonKey(ignore: true)
  _$$_CardListCopyWith<_$_CardList> get copyWith =>
      throw _privateConstructorUsedError;
}
