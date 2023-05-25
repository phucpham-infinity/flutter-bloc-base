import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:pine_app/shared/models/response.dart' as response;
import 'package:pine_app/shared/data/remote/remote.dart';
import 'package:pine_app/shared/exceptions/http_exception.dart';
import 'package:pine_app/shared/data/providers/dio_network_service_provider.dart';

final analyticsServiceProvider = Provider<AnalyticsService>(
  (ref) {
    final NetworkService networkService = ref.watch(netwokServiceProvider);
    return AnalyticsService(networkService);
  },
);

class AnalyticsService {
  final NetworkService networkService;

  AnalyticsService(this.networkService);

  Future<Either<AppException, response.Response>> getAnalyticsSummary({
    required String startDate,
    required String endDate,
  }) async {
    print('getAnalyticsSummary');
    return networkService.get('/analytics/summary', queryParameters: {
      "start_date": startDate,
      "end_date": endDate,
    });
  }

  Future<Either<AppException, response.Response>> getAnalyticsIncomeExpense({
    required String startDate,
    required String endDate,
  }) async {
    return networkService
        .get('/analytics/income-expensemmary', queryParameters: {
      "start_date": startDate,
      "end_date": endDate,
    });
  }

  Future<Either<AppException, response.Response>> getAnalyticsCashFlow({
    required String startDate,
    required String endDate,
  }) async {
    return networkService.get('/analytics/cash-flow', queryParameters: {
      "start_date": startDate,
      "end_date": endDate,
    });
  }

  Future<Either<AppException, response.Response>> getAnalyticsBudget({
    required String startDate,
    required String endDate,
  }) async {
    return networkService.get('/analytics/budget', queryParameters: {
      "start_date": startDate,
      "end_date": endDate,
    });
  }

  Future<Either<AppException, response.Response>> getAnalyticsProjections({
    required String startDate,
    required String endDate,
  }) async {
    return networkService.get('/analytics/projections', queryParameters: {
      "start_date": startDate,
      "end_date": endDate,
    });
  }
}
