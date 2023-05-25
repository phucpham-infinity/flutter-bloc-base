// ignore_for_file: invalid_annotation_target, depend_on_referenced_packages

import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_balance_model.freezed.dart';
part 'account_balance_model.g.dart';

@freezed
abstract class AccountBalance with _$AccountBalance {
  const factory AccountBalance({
    @Default('') @JsonKey(name: 'account_id') String accountId,
    @Default('') String balance,
  }) = _AccountBalance;

  factory AccountBalance.fromJson(Map<String, dynamic> json) =>
      _$AccountBalanceFromJson(json);
}

@freezed
abstract class AccountBalanceList with _$AccountBalanceList {
  const factory AccountBalanceList({
    @Default([]) List<AccountBalance> accountBalanceList,
  }) = _AccountBalanceList;
  factory AccountBalanceList.fromJson(Map<String, dynamic> json) =>
      _$AccountBalanceListFromJson(json);
}
