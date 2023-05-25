// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Card _$$_CardFromJson(Map<String, dynamic> json) => _$_Card(
      cardId: json['card_id'] as String? ?? '',
      cardType: json['card_type'] as String? ?? '',
      cardNickname: json['card_nickname'] as String? ?? '',
      status: json['status'] as String? ?? '',
    );

Map<String, dynamic> _$$_CardToJson(_$_Card instance) => <String, dynamic>{
      'card_id': instance.cardId,
      'card_type': instance.cardType,
      'card_nickname': instance.cardNickname,
      'status': instance.status,
    };

_$_CardList _$$_CardListFromJson(Map<String, dynamic> json) => _$_CardList(
      cardList: (json['cardList'] as List<dynamic>?)
              ?.map((e) => Card.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_CardListToJson(_$_CardList instance) =>
    <String, dynamic>{
      'cardList': instance.cardList,
    };
