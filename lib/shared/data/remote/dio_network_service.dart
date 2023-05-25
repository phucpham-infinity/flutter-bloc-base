import 'package:dartz/dartz.dart';
import './remote.dart';
import '../../exceptions/http_exception.dart';
import '../../models/response.dart' as response;
import '../../exceptions/exception_handler_mixin.dart';
import '../../globals.dart';
import '../../configs/app_configs.dart';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioNetworkService extends NetworkService with ExceptionHandlerMixin {
  final Dio dio;
  DioNetworkService(this.dio) {
    // this throws error while running test
    if (!kTestMode) {
      dio.options = dioBaseOptions;
      if (kDebugMode) {
        dio.interceptors
            .add(LogInterceptor(requestBody: true, responseBody: true));
      }
    }
  }

  BaseOptions get dioBaseOptions => BaseOptions(
        baseUrl: baseUrl,
        headers: headers,
      );
  @override
  String get baseUrl => AppConfigs.baseUrl;

  @override
  Map<String, Object> get headers => {
        'accept': 'application/json',
        'content-type': 'application/json',
      };

  @override
  Map<String, dynamic>? updateHeader(Map<String, dynamic> data) {
    final header = {...data, ...headers};
    if (!kTestMode) {
      dio.options.headers = header;
    }
    return header;
  }

  @override
  Future<Either<AppException, response.Response>> post(String endpoint,
      {Map<String, dynamic>? data}) async {
    try {
      final res = await handleException(
        () => dio.post(
          endpoint,
          data: data,
        ),
        endpoint: endpoint,
      );
      return res.fold(
        (exception) {
          return Left(exception);
        },
        (response) {
          return Right(response);
        },
      );
    } catch (e) {
      if (kDebugMode) {
        print('ERROR $e');
      }
      return Left(
        AppException(
          message: 'Unknown error occured',
          statusCode: 1,
          identifier: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<AppException, response.Response>> get(String endpoint,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final res = await handleException(
        () => dio.get(
          endpoint,
          queryParameters: queryParameters,
        ),
        endpoint: endpoint,
      );
      return res.fold(
        (exception) {
          return Left(exception);
        },
        (response) {
          return Right(response);
        },
      );
    } catch (e) {
      if (kDebugMode) {
        print('ERROR $e');
      }
      return Left(
        AppException(
          message: 'Unknown error occured',
          statusCode: 1,
          identifier: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<AppException, response.Response>> delete(
      String endpoint) async {
    try {
      final res = await handleException(
        () => dio.delete(endpoint),
        endpoint: endpoint,
      );
      return res.fold(
        (exception) {
          return Left(exception);
        },
        (response) {
          return Right(response);
        },
      );
    } catch (e) {
      if (kDebugMode) {
        print('ERROR $e');
      }
      return Left(
        AppException(
          message: 'Unknown error occured',
          statusCode: 1,
          identifier: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<AppException, response.Response>> put(String endpoint,
      {Map<String, dynamic>? data}) async {
    try {
      final res = await handleException(
        () => dio.put(
          endpoint,
          data: data,
        ),
        endpoint: endpoint,
      );
      return res.fold(
        (exception) {
          return Left(exception);
        },
        (response) {
          return Right(response);
        },
      );
    } catch (e) {
      if (kDebugMode) {
        print('ERROR $e');
      }
      return Left(
        AppException(
          message: 'Unknown error occured',
          statusCode: 1,
          identifier: e.toString(),
        ),
      );
    }
  }
}
