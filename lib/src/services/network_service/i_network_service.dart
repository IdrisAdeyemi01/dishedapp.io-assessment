import 'package:dished_assessment/src/services/base/api.dart';
import 'package:dished_assessment/src/services/network_service/http_service_impl.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class INetworkService {
  API get getAPI;

  WeatherApi get getWeatherApi;

  Future<dynamic> get(Uri uri);

  Future<dynamic> post(
    Uri uri, {
    Map<String, dynamic> inputJson,
    Map<String, String>? headers,
  });

  Future<dynamic> put(
    Uri uri, {
    required Map<String, dynamic> inputJson,
  });

  Future<dynamic> delete(Uri uri);
}

final networkService = Provider<INetworkService>(
  (ref) => HttpServiceImpl(),
);
