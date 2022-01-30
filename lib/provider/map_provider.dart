import 'dart:ui' as ui;
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapProvider extends ChangeNotifier {
  BitmapDescriptor? _currentLocationMarker;

  BitmapDescriptor? get currentLocationMarker => _currentLocationMarker;

  MapProvider() {
    setCurrentLocationMarker();
  }

  Future<void> setCurrentLocationMarker() async {
    _currentLocationMarker = BitmapDescriptor.fromBytes(await getBytesFromAsset());
    notifyListeners();
  }

  Future<Uint8List> getBytesFromAsset() async {
    ByteData data = await rootBundle.load('assets/current_location_marker.png');
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List());
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }
}
