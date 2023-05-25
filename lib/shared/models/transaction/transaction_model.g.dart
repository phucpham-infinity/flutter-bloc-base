// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Transaction _$$_TransactionFromJson(Map<String, dynamic> json) =>
    _$_Transaction(
      id: json['id'] as String? ?? "",
      accountId: json['account_id'] as String? ?? "",
      amount: json['amount'] as int? ?? 0,
      type: json['type'] as String? ?? "",
      category: json['category'] as String? ?? "",
      description: json['description'] as String? ?? "",
      date: json['date'] as String? ?? "",
    );

Map<String, dynamic> _$$_TransactionToJson(_$_Transaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'account_id': instance.accountId,
      'amount': instance.amount,
      'type': instance.type,
      'category': instance.category,
      'description': instance.description,
      'date': instance.date,
    };

_$_TransactionList _$$_TransactionListFromJson(Map<String, dynamic> json) =>
    _$_TransactionList(
      transactionList: (json['transactionList'] as List<dynamic>?)
              ?.map((e) => Transaction.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_TransactionListToJson(_$_TransactionList instance) =>
    <String, dynamic>{
      'transactionList': instance.transactionList,
    };
