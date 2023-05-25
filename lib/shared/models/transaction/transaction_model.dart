// ignore_for_file: invalid_annotation_target, depend_on_referenced_packages

import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_model.freezed.dart';
part 'transaction_model.g.dart';

@freezed
abstract class Transaction with _$Transaction {
  const factory Transaction({
    @Default("") String id,
    @Default("") @JsonKey(name: 'account_id') String accountId,
    @Default(0) int amount,
    @Default("") String type,
    @Default("") String category,
    @Default("") String description,
    @Default("") String date,
  }) = _Transaction;

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);
}

@freezed
abstract class TransactionList with _$TransactionList {
  const factory TransactionList({
    @Default([]) List<Transaction> transactionList,
  }) = _TransactionList;
  factory TransactionList.fromJson(Map<String, dynamic> json) =>
      _$TransactionListFromJson(json);
}
