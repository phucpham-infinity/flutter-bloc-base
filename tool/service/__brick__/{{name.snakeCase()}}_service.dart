import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:pine_app/shared/models/response.dart' as response;
import 'package:pine_app/shared/data/remote/remote.dart';
import 'package:pine_app/shared/exceptions/http_exception.dart';
import 'package:pine_app/shared/data/providers/dio_network_service_provider.dart';

final {{name.camelCase()}}ServiceProvider = Provider<{{name.pascalCase()}}Service>(
  (ref) {
    final NetworkService networkService = ref.watch(netwokServiceProvider);
    return {{name.pascalCase()}}Service(networkService);
  },
);


class {{name.pascalCase()}}Service {
  final NetworkService networkService;

  {{name.pascalCase()}}Service(this.networkService);
  
  Future<Either<AppException, response.Response>> get{{name.pascalCase()}}(
      {String? data}) async {
    return networkService.get('/{{name.camelCase()}}', queryParameters: {
      "data": data,
    });
  }

  Future<Either<AppException, response.Response>> post{{name.pascalCase()}}({
    required String data,
  }) async {
    return networkService.post('/{{name.camelCase()}}', data: {
      'data': data,
    });
  }

  Future<Either<AppException, response.Response>> put{{name.pascalCase()}}ById({
    required String id,
    String? data,
  }) async {
    return networkService.put('/{{name.camelCase()}}/$id', data: {
      'data': data,
    });
  }

  Future<Either<AppException, response.Response>> get{{name.pascalCase()}}ById(
      {required String id}) async {
    return networkService.get('/{{name.camelCase()}}/$id');
  }

  Future<Either<AppException, response.Response>> delete{{name.pascalCase()}}ById(
      {required String id}) async {
    return networkService.delete('/{{name.camelCase()}}/$id');
  }
}
