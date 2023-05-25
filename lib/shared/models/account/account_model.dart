// ignore_for_file: invalid_annotation_target, depend_on_referenced_packages

import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_model.freezed.dart';
part 'account_model.g.dart';

@freezed
abstract class Account with _$Account {
  const factory Account({
    @Default("") String id,
    @Default("") @JsonKey(name: 'account_name') String accountName,
    @Default("") @JsonKey(name: 'account_number') String accountNumber,
    @Default("") @JsonKey(name: 'balance') int balance,
  }) = _Account;

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);
}

@freezed
abstract class AccountList with _$AccountList {
  const factory AccountList({
    @Default([]) List<Account> accountList,
  }) = _AccountList;
  factory AccountList.fromJson(Map<String, dynamic> json) =>
      _$AccountListFromJson(json);
}
