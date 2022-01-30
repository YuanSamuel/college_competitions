import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class StringHelper {
  Future<String> getLocationName(Position location) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(location.latitude, location.latitude);

    String name = '';

    name += placemarks[0].name ?? '';
    name += placemarks[0].locality ?? '';
    name += placemarks[0].administrativeArea ?? '';

    return name;
  }

  String getDateString(DateTime time) {
    return time.month.toString() + '/' + time.day.toString() + '/' + time.year.toString();
  }
}
