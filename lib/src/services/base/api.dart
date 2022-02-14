import 'package:dished_assessment/src/services/base/secret_variables.dart';

class API {
  static const String scheme = 'https';
  static const host = 'github.com';

  //Authentication
  Uri get loginWithGithub =>
      Uri(scheme: scheme, host: host, path: 'login/oauth/access_token');
}

class WeatherApi {
  static const String scheme = 'https';
  static const host = 'api.openweathermap.org';

  Uri getWeatherDetails(double lat, double long) => Uri(
        scheme: scheme,
        host: host,
        path: 'data/2.5/weather',
        queryParameters: <String, String>{
          'lat': lat.toString(),
          'lon': long.toString(),
          'appid': openWeatherMapAPIKey
        },
      );
}
