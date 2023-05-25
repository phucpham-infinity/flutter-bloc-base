import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:pine_app/shared/models/response.dart' as response;
import 'package:pine_app/shared/data/remote/remote.dart';
import 'package:pine_app/shared/exceptions/http_exception.dart';
import 'package:pine_app/shared/data/providers/dio_network_service_provider.dart';

final companyServiceProvider = Provider<CompanyService>(
  (ref) {
    final NetworkService networkService = ref.watch(netwokServiceProvider);
    return CompanyService(networkService);
  },
);

class CompanyService {
  final NetworkService networkService;

  CompanyService(this.networkService);

  Future<Either<AppException, response.Response>> getCompany() async {
    return networkService.get('/companies');
  }

  Future<Either<AppException, response.Response>> postCompany({
    required String name,
    required String address,
    required String city,
    required String state,
    required String country,
    required String postalCode,
    required String phone,
    required String email,
  }) async {
    return networkService.post('/companies', data: {
      'name': name,
      'address': address,
      'city': city,
      'state': state,
      'country': country,
      'phone': phone,
      'email': email,
      'postal_code': postalCode,
    });
  }

  Future<Either<AppException, response.Response>> putCompanyById({
    required String id,
    String? name,
    String? address,
    String? city,
    String? state,
    String? country,
    String? postalCode,
    String? phone,
    String? email,
  }) async {
    return networkService.put('/companies/$id', data: {
      'name': name,
      'address': address,
      'city': city,
      'state': state,
      'country': country,
      'phone': phone,
      'email': email,
      'postal_code': postalCode,
    });
  }

  Future<Either<AppException, response.Response>> getCompanyById(
      {required String id}) async {
    return networkService.get('/companies/$id');
  }

  Future<Either<AppException, response.Response>> deleteCompanyById(
      {required String id}) async {
    return networkService.delete('/companies/$id');
  }

  Future<Either<AppException, response.Response>> postCompanyUsersById({
    required String userId,
  }) async {
    return networkService.post('/companies', data: {
      'user_id': userId,
    });
  }

  Future<Either<AppException, response.Response>> deleteCompanyUsresById({
    required String id,
    required String userId,
  }) async {
    return networkService.delete('/companies/$id/users/$userId');
  }
}
