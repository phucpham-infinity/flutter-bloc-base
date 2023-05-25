// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_balance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AccountBalance _$$_AccountBalanceFromJson(Map<String, dynamic> json) =>
    _$_AccountBalance(
      accountId: json['account_id'] as String? ?? '',
      balance: json['balance'] as String? ?? '',
    );

Map<String, dynamic> _$$_AccountBalanceToJson(_$_AccountBalance instance) =>
    <String, dynamic>{
      'account_id': instance.accountId,
      'balance': instance.balance,
    };

_$_AccountBalanceList _$$_AccountBalanceListFromJson(
        Map<String, dynamic> json) =>
    _$_AccountBalanceList(
      accountBalanceList: (json['accountBalanceList'] as List<dynamic>?)
              ?.map((e) => AccountBalance.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_AccountBalanceListToJson(
        _$_AccountBalanceList instance) =>
    <String, dynamic>{
      'accountBalanceList': instance.accountBalanceList,
    };
