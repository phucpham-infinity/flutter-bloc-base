// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Account _$$_AccountFromJson(Map<String, dynamic> json) => _$_Account(
      id: json['id'] as String? ?? "",
      accountName: json['account_name'] as String? ?? "",
      accountNumber: json['account_number'] as String? ?? "",
      balance: json['balance'] as int? ?? "",
    );

Map<String, dynamic> _$$_AccountToJson(_$_Account instance) =>
    <String, dynamic>{
      'id': instance.id,
      'account_name': instance.accountName,
      'account_number': instance.accountNumber,
      'balance': instance.balance,
    };

_$_AccountList _$$_AccountListFromJson(Map<String, dynamic> json) =>
    _$_AccountList(
      accountList: (json['accountList'] as List<dynamic>?)
              ?.map((e) => Account.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_AccountListToJson(_$_AccountList instance) =>
    <String, dynamic>{
      'accountList': instance.accountList,
    };
