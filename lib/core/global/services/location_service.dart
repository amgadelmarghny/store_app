import 'package:location/location.dart';

abstract class LocationService {
  static Location location = Location();

  static Future<bool> checkAndRequestLocationService() async {
    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return false;
      }
    }
    return true;
  }

  static Future<bool> checkAndRequestLocationPermission() async {
    PermissionStatus permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.deniedForever) {
      return false;
    } else {
      if (permissionGranted == PermissionStatus.denied) {
        permissionGranted = await location.requestPermission();
        return permissionGranted == PermissionStatus.granted;
      }
    }
    return true;
  }

  static Future<LocationData> getCurrentLocation() async {
    return await location.getLocation();
  }
}
