import 'package:dished_assessment/src/services/location_service/location_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class ILocationService {
  Future<Position> getLocation();
}

final locationService = Provider<ILocationService>(
  (ref) => LocationService(),
);
