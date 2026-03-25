import 'package:geolocator/geolocator.dart';
import '../models/device_location.dart';

class LocationService {
  Future<DeviceLocation?> getCurrentLocation() async {
    final bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return null;
    }

    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) return null;
    }

    if (permission == LocationPermission.deniedForever) return null;

    try {
      final Position position = await Geolocator.getCurrentPosition();

      return DeviceLocation(
        latitude: position.latitude,
        longitude: position.longitude,
        accuracyMeters: position.accuracy,
        altitudeMeters: position.altitude,
        timestamp: position.timestamp,
      );
    } catch (_) {
      return null;
    }
  }

  Future<Map<String, dynamic>?> getCurrentLocationJson() async {
    final location = await getCurrentLocation();
    return location?.toJson();
  }
}
