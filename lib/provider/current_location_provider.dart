import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';

class CurrentLocationProvider extends ChangeNotifier {
  Position? _position;

  Position? get position => _position;

  CurrentLocationProvider() {
    setUpStream();
  }

  Future<void> setUpStream() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are denied forever');
    }

    Geolocator.getPositionStream(
            locationSettings: LocationSettings(accuracy: LocationAccuracy.best))
        .listen((Position newPosition) {
      _position = newPosition;
      notifyListeners();
    });
  }
}
