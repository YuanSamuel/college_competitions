import 'package:college_competitions/models/Event.dart';
import 'package:college_competitions/models/Job.dart';
import 'package:college_competitions/provider/current_location_provider.dart';
import 'package:college_competitions/provider/events_provider.dart';
import 'package:college_competitions/provider/jobs_provider.dart';
import 'package:college_competitions/provider/map_provider.dart';
import 'package:college_competitions/utils/style_constants.dart';
import 'package:college_competitions/widgets/event_map_widget.dart';
import 'package:college_competitions/widgets/job_map_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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

  double width = StyleConstants.width;
  double height = StyleConstants.height;

  Job? _selectedJob;
  Event? _selectedEvent;

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
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            initialCameraPosition: _cameraPosition!,
            onMapCreated: (controller) => _googleMapController = controller,
            //adding markers to map
            markers: _createMarkers(),
            onTap: (LatLng position) {
              _selectedEvent = null;
              _selectedJob = null;
              setState(() {});
            },
          ),
          _selectedJob != null
              ? Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: height * 0.3,

                    child: JobMapWidget(
                      job: _selectedJob!,
                    ),
                  ),
                )
              : _selectedEvent != null
                  ? Align(
                      alignment: Alignment.bottomCenter,
                      child: EventMapWidget(
                        event: _selectedEvent!,
                      ),
                    )
                  : _getBottomList(),
        ],
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
            // infoWindow: InfoWindow(title: job.name, snippet: job.description),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueGreen),
            onTap: () {
              _selectedEvent = null;
              _selectedJob = job;
              setState(() {});
            }),
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
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
            onTap: () {
              _selectedEvent = event;
              _selectedJob = null;
              setState(() {});
            }),
      );
    }

    return markers;
  }

  Widget _getBottomList() {
    JobsProvider jobsProvider = Provider.of<JobsProvider>(context);
    EventsProvider eventsProvider = Provider.of<EventsProvider>(context);

    List<Widget> opportunities = [];
    for (Job job in jobsProvider.allJobs) {
      opportunities.add(JobMapWidget(job: job));
    }
    for (Event event in eventsProvider.allEvents) {
      opportunities.add(EventMapWidget(event: event));
    }

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: height * 0.4,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
            itemCount: opportunities.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: opportunities[index],
              );
            }),
      ),
    );
  }
}
