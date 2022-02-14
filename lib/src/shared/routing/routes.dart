import 'package:dished_assessment/src/features/view/entry_view.dart';
import 'package:dished_assessment/src/features/view/home_view.dart';
import 'package:dished_assessment/src/features/view/weather_view.dart';
import 'package:flutter/material.dart';

class Routes {
  static const entryView = '/entryView';
  static const homeView = '/homeView';
  static const weatherView = '/weatherView';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case entryView:
        return MaterialPageRoute(
          builder: (_) => const EntryView(),
        );

      case homeView:
        return MaterialPageRoute(
          builder: (_) => const HomeView(),
        );
      case weatherView:
        return MaterialPageRoute(
          builder: (_) => const WeatherView(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('The page ${settings.name} has not been defined'),
            ),
          ),
        );
    }
  }
}
