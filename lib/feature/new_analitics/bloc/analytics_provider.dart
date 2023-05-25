// ignore_for_file: unused_import

import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'analytics_notifier.dart';
import 'analytics_state.dart';
import 'package:pine_app/shared/services/analytics_service.dart';

final analyticsProvider =
    StateNotifierProvider<AnalyticsNotifier, AnalyticsState>((ref) {
  final AnalyticsService analyticsService = ref.watch(analyticsServiceProvider);

  return AnalyticsNotifier(analyticsService: analyticsService)..initial();
});
