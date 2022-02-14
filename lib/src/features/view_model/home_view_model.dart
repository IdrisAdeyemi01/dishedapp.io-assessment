import 'package:dished_assessment/src/content/constants/strings.dart';
import 'package:dished_assessment/src/content/utilities/base_change_notifiers.dart';
import 'package:dished_assessment/src/services/location_service/i_location_service.dart';
import 'package:dished_assessment/src/services/navigation_service/i_navigation_service.dart';
import 'package:dished_assessment/src/shared/routing/routes.dart';
import 'package:dished_assessment/src/shared/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeViewModel extends BaseChangeNotifier {
  HomeViewModel(this.read);
  final Reader read;

  Future<Object?>? navigateToHomeView() {
    read(navigationService).toNamed(Routes.homeView);
  }

  Future<Object?>? navigateToWeatherView() {
    read(navigationService).toNamed(Routes.weatherView);
  }

  Future<List<double>> checkCurrentLocation() async {
    Position position = await read(locationService).getLocation();
    var lat = position.latitude;
    var long = position.longitude;
    read(navigationService).showCustomDialog(
      alertWidget: AlertDialog(
        title: const Text(AppStrings.yourLocation),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const Text(AppStrings.latitude),
                Text(lat.toString()),
              ],
            ),
            const Spacing.bigHeight(),
            Row(
              children: [
                const Text(AppStrings.longitude),
                Text(long.toString()),
              ],
            ),
          ],
        ),
      ),
    );
    return [lat, long];
  }
}

final homeViewModel = ChangeNotifierProvider(
  (ref) => HomeViewModel(ref.read),
);
