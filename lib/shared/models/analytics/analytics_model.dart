// ignore_for_file: invalid_annotation_target, depend_on_referenced_packages

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pine_app/shared/models/account_balance/account_balance_model.dart';

part 'analytics_model.freezed.dart';
part 'analytics_model.g.dart';

@freezed
abstract class Analytics with _$Analytics {
  const factory Analytics({
    @Default(0)
        int income,
    @Default(0)
        int expenses,
    @Default([])
    @JsonKey(name: 'account_balances')
        List<AccountBalance> accountBalances,
  }) = _Analytics;

  factory Analytics.fromJson(Map<String, dynamic> json) =>
      _$AnalyticsFromJson(json);
}

@freezed
abstract class AnalyticsList with _$AnalyticsList {
  const factory AnalyticsList({
    @Default([]) List<Analytics> analyticsList,
  }) = _AnalyticsList;
  factory AnalyticsList.fromJson(Map<String, dynamic> json) =>
      _$AnalyticsListFromJson(json);
}
