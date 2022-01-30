import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  List<Marker> eventMarkers = [];
  static const _my_college_camera_position = CameraPosition(
      //default set to UT Austin.
      target: LatLng(30.2849, 97.7341),
      zoom: 10);

  late GoogleMapController _googleMapController;

  @override
  void dispose(){
    _googleMapController.dispose();
    super.dispose();
  }
  //
  // Widget _buildContainer() {
  //   return Align(
  //     alignment: Alignment.bottomLeft,
  //     child: Container(
  //       margin: EdgeInsets.symmetric(vertical: 20, 0),
  //       height: 150.0,
  //         child: ListView(
  //           scrollDirection: Axis.horizontal,
  //           //this widget is static, should be fixed
  //           children: <Widget>[
  //             SizedBox(width: 10.0),
  //             Padding(
  //                 padding: const EdgeInsets.all(8.0),
  //                 child: boxes(
  //                   //image url, lat, long, "name" of event goes in
  //                 ),)
  //           ],
  //         ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('map screen'),
      ),
      // body: GoogleMap(
      //   mapType: MapType.normal,
      //   myLocationButtonEnabled: false,
      //   zoomControlsEnabled: false,
      //   initialCameraPosition: _my_college_camera_position,
      //   onMapCreated: (controller) => _googleMapController = controller,
      //   //adding markers to map
      //   markers: {
      //     // markers should go in here
      //   },
      // ),
    );
  }
}

// Creates a marker from the event?
Marker createMarker(String markerId, LatLng position, String infoTitle) {
  return Marker(
    markerId: MarkerId(markerId),
    position: position,
    infoWindow: InfoWindow(title: infoTitle),
    icon: BitmapDescriptor.defaultMarker);
}