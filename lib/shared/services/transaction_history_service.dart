import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:pine_app/shared/models/response.dart' as response;
import 'package:pine_app/shared/data/remote/remote.dart';
import 'package:pine_app/shared/exceptions/http_exception.dart';
import 'package:pine_app/shared/data/providers/dio_network_service_provider.dart';

final transactionHistoryServiceProvider = Provider<TransactionHistoryService>(
  (ref) {
    final NetworkService networkService = ref.watch(netwokServiceProvider);
    return TransactionHistoryService(networkService);
  },
);

class TransactionHistoryService {
  final NetworkService networkService;

  TransactionHistoryService(this.networkService);

  Future<Either<AppException, response.Response>> getTransactionHistory({
    String? startDate,
    String? endDate,
    String? accountId,
    String? transactionType,
  }) async {
    return networkService.get('/transaction-history', queryParameters: {
      "start_date": startDate,
      "end_date": endDate,
      "account_id": accountId,
      "transaction_type": transactionType,
    });
  }
}
