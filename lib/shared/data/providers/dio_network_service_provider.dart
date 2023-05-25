import 'package:dio/dio.dart';
import '../remote/dio_network_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final netwokServiceProvider = Provider<DioNetworkService>(
  (ref) {
    final Dio dio = Dio();
    return DioNetworkService(dio);
  },
);
