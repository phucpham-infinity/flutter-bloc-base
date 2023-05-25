import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:pine_app/shared/models/response.dart' as response;
import 'package:pine_app/shared/data/remote/remote.dart';
import 'package:pine_app/shared/exceptions/http_exception.dart';
import 'package:pine_app/shared/data/providers/dio_network_service_provider.dart';

final cardServiceProvider = Provider<CardService>(
  (ref) {
    final NetworkService networkService = ref.watch(netwokServiceProvider);
    return CardService(networkService);
  },
);

class CardService {
  final NetworkService networkService;

  CardService(this.networkService);

  Future<Either<AppException, response.Response>> getCard() async {
    return networkService.get(
      '/cards',
    );
  }

  Future<Either<AppException, response.Response>> postCard({
    required String cardType,
    required String cardNickname,
  }) async {
    return networkService.post('/card', data: {
      'card_type': cardType,
      "card_nickname": cardNickname,
    });
  }

  Future<Either<AppException, response.Response>> putCardById({
    required String id,
    String? cardNickname,
  }) async {
    return networkService.put('/cards/$id', data: {
      'card_nickname': cardNickname,
    });
  }

  Future<Either<AppException, response.Response>> getCardById(
      {required String id}) async {
    return networkService.get('/cards/$id');
  }

  Future<Either<AppException, response.Response>> deleteCardById(
      {required String id}) async {
    return networkService.delete('/cards/$id');
  }

  Future<Either<AppException, response.Response>> postCardActivateById({
    required String id,
  }) async {
    return networkService.post('/card/$id/activate');
  }

  Future<Either<AppException, response.Response>> postCardDeactivateById({
    required String id,
  }) async {
    return networkService.post('/card/$id/deactivate');
  }

  Future<Either<AppException, response.Response>> postCardLockById({
    required String id,
  }) async {
    return networkService.post('/card/$id/lock');
  }

  Future<Either<AppException, response.Response>> postCardUnlockById({
    required String id,
  }) async {
    return networkService.post('/card/$id/unlock');
  }

  Future<Either<AppException, response.Response>> getCardTransactionsById({
    required String id,
  }) async {
    return networkService.get(
      '/cards/$id/transactions',
    );
  }

  Future<Either<AppException, response.Response>> postCardTransactionsById({
    required String description,
    required String amount,
    required String currency,
  }) async {
    return networkService.post('/card', data: {
      'description': description,
      "amount": amount,
      "currency": currency,
    });
  }
}
