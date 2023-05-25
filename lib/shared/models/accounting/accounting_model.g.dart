// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accounting_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Accounting _$$_AccountingFromJson(Map<String, dynamic> json) =>
    _$_Accounting(
      id: json['id'] as String? ?? "",
      expenseNumber: json['expense_number'] as String? ?? "",
      invoiceNumber: json['invoice_number'] as String? ?? "",
      vendorId: json['vendor_id'] as String? ?? "",
      customerId: json['customer_id'] as String? ?? "",
      date: json['date'] as String? ?? "",
      dueDate: json['due_date'] as String? ?? "",
      status: json['status'] as String? ?? "",
      totalAmount: json['total_amount'] as String? ?? "",
      currency: json['currency'] as String? ?? "",
    );

Map<String, dynamic> _$$_AccountingToJson(_$_Accounting instance) =>
    <String, dynamic>{
      'id': instance.id,
      'expense_number': instance.expenseNumber,
      'invoice_number': instance.invoiceNumber,
      'vendor_id': instance.vendorId,
      'customer_id': instance.customerId,
      'date': instance.date,
      'due_date': instance.dueDate,
      'status': instance.status,
      'total_amount': instance.totalAmount,
      'currency': instance.currency,
    };

_$_AccountingList _$$_AccountingListFromJson(Map<String, dynamic> json) =>
    _$_AccountingList(
      accountingList: (json['accountingList'] as List<dynamic>?)
              ?.map((e) => Accounting.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_AccountingListToJson(_$_AccountingList instance) =>
    <String, dynamic>{
      'accountingList': instance.accountingList,
    };
