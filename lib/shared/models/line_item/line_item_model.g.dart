// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'line_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LineItem _$$_LineItemFromJson(Map<String, dynamic> json) => _$_LineItem(
      quantity: json['quantity'] as int? ?? 0,
      description: json['description'] as String? ?? "",
      unitPrice: json['unit_price'] as int? ?? "",
    );

Map<String, dynamic> _$$_LineItemToJson(_$_LineItem instance) =>
    <String, dynamic>{
      'quantity': instance.quantity,
      'description': instance.description,
      'unit_price': instance.unitPrice,
    };

_$_LineItemList _$$_LineItemListFromJson(Map<String, dynamic> json) =>
    _$_LineItemList(
      lineItemList: (json['lineItemList'] as List<dynamic>?)
              ?.map((e) => LineItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_LineItemListToJson(_$_LineItemList instance) =>
    <String, dynamic>{
      'lineItemList': instance.lineItemList,
    };
