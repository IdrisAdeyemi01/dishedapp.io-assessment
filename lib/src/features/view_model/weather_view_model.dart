import 'package:dished_assessment/src/content/utilities/base_change_notifiers.dart';
import 'package:dished_assessment/src/content/utilities/screen_util.dart';
import 'package:dished_assessment/src/features/models/weather.dart';
import 'package:dished_assessment/src/repository/weather_repository/i_weather_repository.dart';
import 'package:dished_assessment/src/services/location_service/i_location_service.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WeatherViewModel extends BaseChangeNotifier {
  WeatherViewModel(this.read);
  final Reader read;

  var temperature;
  var description;
  var main;
  var pressure;
  var humidity;
  var weatherSource;
  var isSmallScreen = true;

  Future<List<double>> _getCurrentPosition() async {
    Position position = await read(locationService).getLocation();
    var lat = position.latitude;
    var long = position.longitude;
    return [lat, long];
  }

  void getScreenType(BuildContext context) {
    if (ScreenUtil.screenWidth(context) <= 800) {
      isSmallScreen = true;
      // setState();
    } else {
      isSmallScreen = false;
      // setState();
    }
  }

  // Future<void> getWeatherData() async {
  //   weatherSource = [await getCurrentWeatherDetails()];
  //   setState();
  // }

  Future<Weather> getCurrentWeatherDetails() async {
    final position = await _getCurrentPosition();
    var lat = position[0];
    var long = position[1];

    final currentWeatherDetail = await read(weatherRepository)
        .getWeatherForecast(latitude: lat, longitude: long);
    temperature = currentWeatherDetail.temperature;
    description = currentWeatherDetail.description;
    main = currentWeatherDetail.main;
    pressure = currentWeatherDetail.pressure;
    humidity = currentWeatherDetail.humidity;

    weatherSource = [currentWeatherDetail];
    setState();
    return currentWeatherDetail;
  }
}

final weatherFutureProvider = FutureProvider<Weather>((ref) async {
  return ref.read(weatherViewModel).getCurrentWeatherDetails();
});

final weatherViewModel = ChangeNotifierProvider(
  (ref) => WeatherViewModel(ref.read),
);
