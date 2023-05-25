// ignore_for_file: invalid_annotation_target, depend_on_referenced_packages

import 'package:freezed_annotation/freezed_annotation.dart';

part 'marketplace_model.freezed.dart';
part 'marketplace_model.g.dart';

@freezed
abstract class Marketplace with _$Marketplace {
  const factory Marketplace({
    @Default("") String id,
    @Default("") String name,
    @Default("") String description,
    @Default(0) int price,
    @Default("") String currency,
  }) = _Marketplace;

  factory Marketplace.fromJson(Map<String, dynamic> json) =>
      _$MarketplaceFromJson(json);
}

@freezed
abstract class MarketplaceList with _$MarketplaceList {
  const factory MarketplaceList({
    @Default([]) List<Marketplace> marketplaceList,
  }) = _MarketplaceList;
  factory MarketplaceList.fromJson(Map<String, dynamic> json) =>
      _$MarketplaceListFromJson(json);
}
