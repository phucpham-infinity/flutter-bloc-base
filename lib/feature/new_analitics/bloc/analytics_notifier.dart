// ignore_for_file: unused_import

import 'dart:math';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pine_app/generated/intl/messages_en.dart';
import 'package:pine_app/shared/models/analytics/analytics_model.dart';

import 'analytics_state.dart';
import 'package:pine_app/shared/services/analytics_service.dart';

class AnalyticsNotifier extends StateNotifier<AnalyticsState> {
  final AnalyticsService analyticsService;

  AnalyticsNotifier({required this.analyticsService})
      : super(const AnalyticsState.initial());

  initial() {
    print('[initial] AnalyticsNotifier');
  }

  changeState() async {
    print("****** $state");
    state = state.copyWith(
      message: '',
      status: AnalyticsStatus.loading,
    );
  }

  getAnalyticsSummary(
      {required String startDate, required String endDate}) async {
    print('**********getAnalyticsSummary***********');
    state = state.copyWith(
      message: '',
      status: AnalyticsStatus.loading,
    );
    final res = await analyticsService.getAnalyticsSummary(
        startDate: startDate, endDate: endDate);
    res.fold((error) {
      state = state.copyWith(
        message: error.message.toString(),
        status: AnalyticsStatus.failure,
      );
    }, (res) {
      state = state.copyWith(status: AnalyticsStatus.loaded, message: '');
    });
  }

  void resetState() {
    state = const AnalyticsState.initial();
  }
}
