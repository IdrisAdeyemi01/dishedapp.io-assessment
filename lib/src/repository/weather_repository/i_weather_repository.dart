import 'package:dished_assessment/src/features/models/weather.dart';
import 'package:dished_assessment/src/repository/weather_repository/openweathermap_weather_repository.dart';
import 'package:dished_assessment/src/services/network_service/i_network_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class IWeatherReopository {
  Future<Weather> getWeatherForecast({required latitude, required longitude});
}

final weatherRepository = Provider<IWeatherReopository>(
  (ref) => OpenWeatherMapRepository(
    networkService: ref.read(networkService),
  ),
);
