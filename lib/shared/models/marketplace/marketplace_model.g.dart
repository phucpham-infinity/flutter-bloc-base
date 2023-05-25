// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marketplace_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Marketplace _$$_MarketplaceFromJson(Map<String, dynamic> json) =>
    _$_Marketplace(
      id: json['id'] as String? ?? "",
      name: json['name'] as String? ?? "",
      description: json['description'] as String? ?? "",
      price: json['price'] as int? ?? 0,
      currency: json['currency'] as String? ?? "",
    );

Map<String, dynamic> _$$_MarketplaceToJson(_$_Marketplace instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'currency': instance.currency,
    };

_$_MarketplaceList _$$_MarketplaceListFromJson(Map<String, dynamic> json) =>
    _$_MarketplaceList(
      marketplaceList: (json['marketplaceList'] as List<dynamic>?)
              ?.map((e) => Marketplace.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_MarketplaceListToJson(_$_MarketplaceList instance) =>
    <String, dynamic>{
      'marketplaceList': instance.marketplaceList,
    };
