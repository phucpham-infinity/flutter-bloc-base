import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:pine_app/shared/models/response.dart' as response;
import 'package:pine_app/shared/data/remote/remote.dart';
import 'package:pine_app/shared/exceptions/http_exception.dart';
import 'package:pine_app/shared/data/providers/dio_network_service_provider.dart';

final marketplaceServiceProvider = Provider<MarketplaceService>(
  (ref) {
    final NetworkService networkService = ref.watch(netwokServiceProvider);
    return MarketplaceService(networkService);
  },
);

class MarketplaceService {
  final NetworkService networkService;

  MarketplaceService(this.networkService);

  Future<Either<AppException, response.Response>>
      getMarketplaceServices() async {
    return networkService.get('/marketplace/services');
  }

  Future<Either<AppException, response.Response>> postMarketplaceServices({
    required String name,
    required String description,
    required int price,
    required String currency,
  }) async {
    return networkService.post('/marketplace/services', data: {
      'name': name,
      'description': description,
      'price': price,
      'currency': currency,
    });
  }

  Future<Either<AppException, response.Response>> putMarketplaceServicesById({
    required String id,
    String? name,
    String? description,
    int? price,
    String? currency,
  }) async {
    return networkService.put('/marketplace/services/$id', data: {
      'name': name,
      'description': description,
      'price': price,
      'currency': currency,
    });
  }

  Future<Either<AppException, response.Response>> getMarketplaceServicesById(
      {required String id}) async {
    return networkService.get('/marketplace/$id');
  }

  Future<Either<AppException, response.Response>> deleteMarketplaceServicesById(
      {required String id}) async {
    return networkService.delete('/marketplace/$id');
  }

  Future<Either<AppException, response.Response>>
      postMarketplaceServicesSubscribeById({required String id}) async {
    return networkService.post('/marketplace/services/$id/subscribe');
  }

  Future<Either<AppException, response.Response>>
      postMarketplaceServicesUnsubscribeById({required String id}) async {
    return networkService.post('/marketplace/services/$id/unsubscribe');
  }
}
