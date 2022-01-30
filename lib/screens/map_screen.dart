import 'package:college_competitions/models/Event.dart';
import 'package:college_competitions/models/Job.dart';
import 'package:college_competitions/provider/current_location_provider.dart';
import 'package:college_competitions/provider/events_provider.dart';
import 'package:college_competitions/provider/jobs_provider.dart';
import 'package:college_competitions/provider/map_provider.dart';
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
  late MapProvider _mapProvider;
  late CurrentLocationProvider _currentLocationProvider;

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _currentLocationProvider = Provider.of<CurrentLocationProvider>(context);

    _mapProvider = Provider.of<MapProvider>(context);
    if (_cameraPosition == null && _currentLocationProvider.position == null) {
      return Scaffold();
    }
    _cameraPosition ??= CameraPosition(
        //default set to UT Austin.
        target: LatLng(_currentLocationProvider.position!.latitude,
            _currentLocationProvider.position!.longitude),
        zoom: 12);
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

    if (_mapProvider.currentLocationMarker != null) {
      markers.add(Marker(
          markerId: MarkerId('currentLocationMarker'),
          position: LatLng(_currentLocationProvider.position!.latitude,
              _currentLocationProvider.position!.longitude),
          icon: _mapProvider.currentLocationMarker!));
    }

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
