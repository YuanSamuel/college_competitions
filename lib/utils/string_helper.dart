import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geocoding/geocoding.dart';

class StringHelper {
  Future<String> getLocationName(GeoPoint location) async {
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

  String getTimeString(DateTime time) {
    int hour = time.hour % 12;
    if (hour == 0) {
      hour++;
    }
    bool pm = hour >= 12;
    return hour.toString() + ":" + time.minute.toString() + (pm ? 'pm' : 'am');
  }
}
