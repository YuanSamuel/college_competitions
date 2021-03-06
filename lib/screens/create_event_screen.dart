import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:college_competitions/models/Event.dart';
import 'package:college_competitions/provider/current_location_provider.dart';
import 'package:college_competitions/provider/user_provider.dart';
import 'package:college_competitions/services/college_data_service.dart';
import 'package:college_competitions/services/firebase_service.dart';
import 'package:college_competitions/utils/string_helper.dart';
import 'package:college_competitions/utils/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:geocoding/geocoding.dart';
import 'package:provider/provider.dart';

class CreateEventScreen extends StatefulWidget {
  const CreateEventScreen({Key? key}) : super(key: key);

  @override
  _CreateEventScreenState createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  static final List<String> interests = [
    'Gardening',
    'Construction',
    'Cooking',
    'Software',
    'Electrical',
    'Physical Exercise',
    'Environment',
    'Social',
    'Cleanup',
  ];
  TextEditingController _titleInputController = TextEditingController();
  TextEditingController _descriptionInputController = TextEditingController();
  TextEditingController _locationInputController = TextEditingController();
  TextEditingController _numPeopleInputController = TextEditingController();

  String dropDownInitVal2 = '1';

  String dropDownInitVal = "Gardening";

  double width = StyleConstants.width;
  double height = StyleConstants.height;
  DateTime? _eventDate;

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    CurrentLocationProvider currentLocationProvider =
        Provider.of<CurrentLocationProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: height * 1.2,
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: height * 0.2,
                width: width,
                color: Colors.white,
                child: Container(
                  width: width,
                  height: height * 0.2,
                  decoration: BoxDecoration(
                    color: StyleConstants.darkBlue,
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(40.0)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Container(
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: width * 0.1,
                          ),
                          Text(
                            'Create Event',
                            style: StyleConstants.medTextBold
                                .copyWith(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: height,
                width: width,
                color: StyleConstants.darkBlue,
                child: Container(
                  height: height,
                  width: width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(40.0)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                    child: Column(
                      children: [
                        SizedBox(
                          height: height * 0.05,
                        ),
                        TextField(
                          controller: _titleInputController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter event title',
                          ),
                        ),
                        SizedBox(
                          height: height * 0.04,
                        ),
                        TextField(
                          controller: _descriptionInputController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter event description',
                          ),
                        ),
                        SizedBox(
                          height: height * 0.04,
                        ),

                        TextButton(
                          onPressed: () {
                            DatePicker.showDateTimePicker(context,
                                showTitleActions: true,
                                minTime: DateTime(2022, 1, 1),
                                maxTime: DateTime(2030, 12, 31),
                                onConfirm: (date) {
                              _eventDate = date;
                              setState(() {});
                            },
                                currentTime: DateTime.now(),
                                locale: LocaleType.en);
                          },
                          child: const Text(
                            'Pick date & time',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                        _eventDate != null
                            ? Text(
                                StringHelper().getDateString(_eventDate!) +
                                    " " +
                                    StringHelper().getTimeString(_eventDate!),
                              )
                            : const SizedBox.shrink(),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        DropdownButton(
                          value: dropDownInitVal,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: interests.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropDownInitVal = newValue!;
                            });
                          },
                        ),
                        SizedBox(
                          height: height * 0.04,
                        ),

                        TextField(
                          controller: _locationInputController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter location',
                          ),
                        ),
                        SizedBox(
                          height: height * 0.04,
                        ),
                        TextField(
                          controller: _numPeopleInputController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Number of people required',
                          ),
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        GestureDetector(
                          onTap: () async {
                            Location location = await CollegeDataService()
                                .getLocationFromAddress(
                                    _locationInputController.text.trim());

                            Event event = Event(
                              _titleInputController.text.trim(),
                              userProvider.user!.college,
                              _descriptionInputController.text.trim(),
                              userProvider.user!.reference!.id,
                              int.parse(_numPeopleInputController.text.trim()),
                              100,
                              GeoPoint(location.latitude, location.longitude),
                              Timestamp.fromDate(_eventDate!),
                              [dropDownInitVal],
                              [],
                            );

                            FirebaseService().createEvent(event);
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: height * 0.07,
                            width: width * 0.9,
                            decoration: BoxDecoration(
                              color: StyleConstants.darkBlue,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Center(
                              child: Text(
                                'Complete',
                                style: StyleConstants.medTextBold
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                        ),

                        // ElevatedButton(
                        //   onPressed: () {
                        //     Navigator.pop(context);
                        //   },
                        //   child: Text("Create Event"),
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
