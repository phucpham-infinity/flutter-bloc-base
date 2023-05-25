import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:pine_app/shared/models/response.dart' as response;
import 'package:pine_app/shared/data/remote/remote.dart';
import 'package:pine_app/shared/exceptions/http_exception.dart';
import 'package:pine_app/shared/data/providers/dio_network_service_provider.dart';

final transactionServiceProvider = Provider<TransactionService>(
  (ref) {
    final NetworkService networkService = ref.watch(netwokServiceProvider);
    return TransactionService(networkService);
  },
);

class TransactionService {
  final NetworkService networkService;

  TransactionService(this.networkService);

  Future<Either<AppException, response.Response>> getTransactions(
      {String? accountId, String? startDate, String? endDate}) async {
    return networkService.get('/transactions', queryParameters: {
      "account_id": accountId,
      "start_date": startDate,
      "end_date": endDate
    });
  }

  Future<Either<AppException, response.Response>> postTransactions({
    required String accountId,
    required String amount,
    required String type,
    required String category,
    required String description,
    required String date,
  }) async {
    return networkService.post('/transactions', data: {
      'account_id': accountId,
      'amount': amount,
      'type': type,
      'description': description,
      'category': category,
      'date': date,
    });
  }

  Future<Either<AppException, response.Response>> putTransactionsById({
    required String id,
    String? accountId,
    String? amount,
    String? type,
    String? category,
    String? description,
    String? date,
  }) async {
    return networkService.put('/transactions/$id', data: {
      'account_id': accountId,
      'amount': amount,
      'type': type,
      'description': description,
      'category': category,
      'date': date,
    });
  }

  Future<Either<AppException, response.Response>> getTransactionsById(
      {required String id}) async {
    return networkService.get('/transactions/$id');
  }

  Future<Either<AppException, response.Response>> deleteTransactionsById(
      {required String id}) async {
    return networkService.delete('/transactions/$id');
  }
}
