// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analytics_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Analytics _$$_AnalyticsFromJson(Map<String, dynamic> json) => _$_Analytics(
      income: json['income'] as int? ?? 0,
      expenses: json['expenses'] as int? ?? 0,
      accountBalances: (json['account_balances'] as List<dynamic>?)
              ?.map((e) => AccountBalance.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_AnalyticsToJson(_$_Analytics instance) =>
    <String, dynamic>{
      'income': instance.income,
      'expenses': instance.expenses,
      'account_balances': instance.accountBalances,
    };

_$_AnalyticsList _$$_AnalyticsListFromJson(Map<String, dynamic> json) =>
    _$_AnalyticsList(
      analyticsList: (json['analyticsList'] as List<dynamic>?)
              ?.map((e) => Analytics.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_AnalyticsListToJson(_$_AnalyticsList instance) =>
    <String, dynamic>{
      'analyticsList': instance.analyticsList,
    };
