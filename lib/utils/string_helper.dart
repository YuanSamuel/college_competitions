import 'dart:math';

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
    return time.month.toString() +
        '/' +
        time.day.toString() +
        '/' +
        time.year.toString();
  }

  String getTimeString(DateTime time) {
    bool pm = time.hour >= 12;
    int hour = time.hour % 12;
    if (hour == 0) {
      hour = 12;
    }

    String minuteString = time.minute.toString();
    if (minuteString.length == 1) {
      minuteString = '0' + minuteString;
    }
    return hour.toString() + ":" + minuteString + (pm ? 'pm' : 'am');
  }
}
