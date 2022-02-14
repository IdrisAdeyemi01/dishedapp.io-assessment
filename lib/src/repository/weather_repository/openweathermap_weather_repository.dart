import 'dart:convert';
import 'package:dished_assessment/src/features/models/weather.dart';
import 'package:dished_assessment/src/repository/weather_repository/i_weather_repository.dart';
import 'package:dished_assessment/src/services/network_service/i_network_service.dart';
import 'package:http/http.dart';

class OpenWeatherMapRepository implements IWeatherReopository {
  final INetworkService networkService;

  OpenWeatherMapRepository({
    required this.networkService,
  });

  @override
  Future<Weather> getWeatherForecast(
      {required latitude, required longitude}) async {
    Uri uri =
        networkService.getWeatherApi.getWeatherDetails(latitude, longitude);

    final String response = await networkService.post(
      uri,
    );
    final weather = jsonDecode(response) as Map<String, dynamic>;
    return Weather.fromJson(weather);
  }
}
