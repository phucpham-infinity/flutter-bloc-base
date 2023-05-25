// ignore_for_file: invalid_annotation_target, depend_on_referenced_packages

import 'package:freezed_annotation/freezed_annotation.dart';

part 'accounting_model.freezed.dart';
part 'accounting_model.g.dart';

@freezed
abstract class Accounting with _$Accounting {
  const factory Accounting({
    @Default("") String id,
    @Default("") @JsonKey(name: 'expense_number') String expenseNumber,
    @Default("") @JsonKey(name: 'invoice_number') String invoiceNumber,
    @Default("") @JsonKey(name: 'vendor_id') String vendorId,
    @Default("") @JsonKey(name: 'customer_id') String customerId,
    @Default("") String date,
    @Default("") @JsonKey(name: 'due_date') String dueDate,
    @Default("") String status,
    @Default("") @JsonKey(name: 'total_amount') String totalAmount,
    @Default("") String currency,
  }) = _Accounting;

  factory Accounting.fromJson(Map<String, dynamic> json) =>
      _$AccountingFromJson(json);
}

@freezed
abstract class AccountingList with _$AccountingList {
  const factory AccountingList({
    @Default([]) List<Accounting> accountingList,
  }) = _AccountingList;
  factory AccountingList.fromJson(Map<String, dynamic> json) =>
      _$AccountingListFromJson(json);
}
