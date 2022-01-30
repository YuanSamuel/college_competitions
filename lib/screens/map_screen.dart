import 'package:college_competitions/models/Event.dart';
import 'package:college_competitions/models/Job.dart';
import 'package:college_competitions/provider/current_location_provider.dart';
import 'package:college_competitions/provider/events_provider.dart';
import 'package:college_competitions/provider/jobs_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  List<Marker> eventMarkers = [];
  CameraPosition? _cameraPosition;

  late GoogleMapController _googleMapController;

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
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
    CurrentLocationProvider currentLocationProvider =
        Provider.of<CurrentLocationProvider>(context);
    if (_cameraPosition == null && currentLocationProvider.position == null) {
      return Scaffold();
    }
    _cameraPosition ??= CameraPosition(
        //default set to UT Austin.
        target: LatLng(currentLocationProvider.position!.latitude,
            currentLocationProvider.position!.longitude),
        zoom: 10);
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        initialCameraPosition: _cameraPosition!,
        onMapCreated: (controller) => _googleMapController = controller,
        //adding markers to map
        markers: _createMarkers(),
      ),
    );
  }

  Set<Marker> _createMarkers() {
    Set<Marker> markers = {};

    JobsProvider jobsProvider = Provider.of<JobsProvider>(context);

    for (Job job in jobsProvider.allJobs) {
      markers.add(
        Marker(
            markerId: MarkerId(job.reference!.id),
            position: LatLng(
              job.location.latitude,
              job.location.longitude,
            ),
            infoWindow: InfoWindow(title: job.name, snippet: job.description),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueGreen)),
      );
    }

    EventsProvider eventsProvider = Provider.of<EventsProvider>(context);

    for (Event event in eventsProvider.allEvents) {
      markers.add(
        Marker(
            markerId: MarkerId(event.reference!.id),
            position: LatLng(
              event.location.latitude,
              event.location.longitude,
            ),
            infoWindow:
                InfoWindow(title: event.name, snippet: event.description),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueBlue)),
      );
    }

    return markers;
  }
}
