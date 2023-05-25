// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransactionHistory _$$_TransactionHistoryFromJson(
        Map<String, dynamic> json) =>
    _$_TransactionHistory(
      id: json['id'] as String? ?? "",
      accountId: json['account_id'] as String? ?? "",
      transactionType: json['transaction_type'] as String? ?? "",
      amount: json['amount'] as String? ?? "",
      currency: json['currency'] as String? ?? "",
      description: json['description'] as String? ?? "",
      date: json['date'] as String? ?? "",
      category: json['category'] as String? ?? "",
      subcategory: json['subcategory'] as String? ?? "",
    );

Map<String, dynamic> _$$_TransactionHistoryToJson(
        _$_TransactionHistory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'account_id': instance.accountId,
      'transaction_type': instance.transactionType,
      'amount': instance.amount,
      'currency': instance.currency,
      'description': instance.description,
      'date': instance.date,
      'category': instance.category,
      'subcategory': instance.subcategory,
    };

_$_TransactionHistoryList _$$_TransactionHistoryListFromJson(
        Map<String, dynamic> json) =>
    _$_TransactionHistoryList(
      transactionHistoryList: (json['transactionHistoryList'] as List<dynamic>?)
              ?.map(
                  (e) => TransactionHistory.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_TransactionHistoryListToJson(
        _$_TransactionHistoryList instance) =>
    <String, dynamic>{
      'transactionHistoryList': instance.transactionHistoryList,
    };
