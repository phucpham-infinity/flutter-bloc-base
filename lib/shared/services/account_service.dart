import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:pine_app/shared/models/response.dart' as response;
import 'package:pine_app/shared/data/remote/remote.dart';
import 'package:pine_app/shared/exceptions/http_exception.dart';
import 'package:pine_app/shared/data/providers/dio_network_service_provider.dart';

final accountServiceProvider = Provider<AccountService>(
  (ref) {
    final NetworkService networkService = ref.watch(netwokServiceProvider);
    return AccountService(networkService);
  },
);

class AccountService {
  final NetworkService networkService;

  AccountService(this.networkService);

  Future<Either<AppException, response.Response>> getAccounts() async {
    return networkService.get('/accounts');
  }

  Future<Either<AppException, response.Response>> postAccounts({
    required String accountName,
    required String accountNumber,
  }) async {
    return networkService.post('/accounts', data: {
      'account_name': accountName,
      'account_number': accountNumber,
    });
  }

  Future<Either<AppException, response.Response>> getAccountsById(
      {required String id}) async {
    return networkService.get('/accounts/$id');
  }

  Future<Either<AppException, response.Response>> putAccountsById(
      {required String id}) async {
    return networkService.put('/accounts/$id');
  }

  Future<Either<AppException, response.Response>> deleteAccountsById(
      {required String id}) async {
    return networkService.delete('/accounts/$id');
  }
}
