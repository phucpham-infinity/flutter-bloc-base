// ignore_for_file: invalid_annotation_target, depend_on_referenced_packages

import 'package:freezed_annotation/freezed_annotation.dart';

part 'card_model.freezed.dart';
part 'card_model.g.dart';

@freezed
abstract class Card with _$Card {
  const factory Card({
    @Default('') @JsonKey(name: 'card_id') String cardId,
    @Default('') @JsonKey(name: 'card_type') String cardType,
    @Default('') @JsonKey(name: 'card_nickname') String cardNickname,
    @Default('') String status,
  }) = _Card;

  factory Card.fromJson(Map<String, dynamic> json) => _$CardFromJson(json);
}

@freezed
abstract class CardList with _$CardList {
  const factory CardList({
    @Default([]) List<Card> cardList,
  }) = _CardList;
  factory CardList.fromJson(Map<String, dynamic> json) =>
      _$CardListFromJson(json);
}
