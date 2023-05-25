// ignore_for_file: invalid_annotation_target, depend_on_referenced_packages

import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_history_model.freezed.dart';
part 'transaction_history_model.g.dart';

@freezed
abstract class TransactionHistory with _$TransactionHistory {
  const factory TransactionHistory({
    @Default("") String id,
    @Default("") @JsonKey(name: 'account_id') String accountId,
    @Default("") @JsonKey(name: 'transaction_type') String transactionType,
    @Default("") String amount,
    @Default("") String currency,
    @Default("") String description,
    @Default("") String date,
    @Default("") String category,
    @Default("") String subcategory,
  }) = _TransactionHistory;

  factory TransactionHistory.fromJson(Map<String, dynamic> json) =>
      _$TransactionHistoryFromJson(json);
}

@freezed
abstract class TransactionHistoryList with _$TransactionHistoryList {
  const factory TransactionHistoryList({
    @Default([]) List<TransactionHistory> transactionHistoryList,
  }) = _TransactionHistoryList;
  factory TransactionHistoryList.fromJson(Map<String, dynamic> json) =>
      _$TransactionHistoryListFromJson(json);
}
