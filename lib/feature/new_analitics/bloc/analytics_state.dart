// ignore_for_file: unused_import

import 'package:equatable/equatable.dart';
import 'package:pine_app/generated/intl/messages_en.dart';
import 'package:pine_app/shared/models/analytics/analytics_model.dart';

enum AnalyticsStatus {
  initial,
  loading,
  loaded,
  failure,
}

class AnalyticsState extends Equatable {
  final AnalyticsStatus status;
  final String message;
  final Analytics? analyticsSummary;

  const AnalyticsState({
    this.status = AnalyticsStatus.initial,
    this.message = "",
    this.analyticsSummary = null,
  });

  const AnalyticsState.initial({
    this.message = "",
    this.status = AnalyticsStatus.initial,
    this.analyticsSummary = null,
  });

  AnalyticsState copyWith({
    AnalyticsStatus? status,
    String? message,
    Analytics? analyticsSummary,
  }) {
    return AnalyticsState(
      message: message ?? this.message,
      status: status ?? this.status,
      analyticsSummary: analyticsSummary ?? this.analyticsSummary,
    );
  }

  @override
  String toString() {
    return 'AnalyticsState(status: $status, message: $message, analyticsSummary: $analyticsSummary )';
  }

  @override
  List<Object?> get props => [status, message, analyticsSummary];
}
