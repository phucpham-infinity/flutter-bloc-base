// ignore_for_file: invalid_annotation_target, depend_on_referenced_packages

import 'package:freezed_annotation/freezed_annotation.dart';

part 'line_item_model.freezed.dart';
part 'line_item_model.g.dart';

@freezed
abstract class LineItem with _$LineItem {
  const factory LineItem({
    @Default(0) int quantity,
    @Default("") String description,
    @Default("") @JsonKey(name: 'unit_price') int unitPrice,
  }) = _LineItem;

  factory LineItem.fromJson(Map<String, dynamic> json) =>
      _$LineItemFromJson(json);
}

@freezed
abstract class LineItemList with _$LineItemList {
  const factory LineItemList({
    @Default([]) List<LineItem> lineItemList,
  }) = _LineItemList;
  factory LineItemList.fromJson(Map<String, dynamic> json) =>
      _$LineItemListFromJson(json);
}
