import 'package:college_competitions/models/Event.dart';
import 'package:college_competitions/models/User.dart';
import 'package:college_competitions/services/firebase_service.dart';
import 'package:college_competitions/utils/string_helper.dart';
import 'package:college_competitions/utils/style_constants.dart';
import 'package:flutter/material.dart';

class EventMapWidget extends StatefulWidget {
  const EventMapWidget({Key? key, required this.event}) : super(key: key);

  final Event event;

  @override
  _EventMapWidgetState createState() => _EventMapWidgetState();
}

class _EventMapWidgetState extends State<EventMapWidget> {
  String location = '';

  double width = StyleConstants.width;
  double height = StyleConstants.height;
  User? organizer;

  @override
  void initState() {
    getData();
    super.initState();
  }

  Future<void> getData() async {
    organizer = await FirebaseService().getOrganizer(widget.event.organizerId);
    location = await StringHelper().getLocationName(widget.event.location);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => EventMapWidget(event: widget.event),
              ),
            );
          },
          child: Container(
            width: width * 0.8,
            height: height * 0.28,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: height * 0.24,
                    width: width * 0.8,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25.0)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: width * 0.05, vertical: height * 0.015),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    child: Text(
                                      StringHelper().getDateString(
                                          widget.event.date.toDate()),
                                      style: StyleConstants.subTextReg,
                                    ),
                                  ),
                                  Text(
                                    StringHelper()
                                        .getTimeString(widget.event.date.toDate()),
                                    style: StyleConstants.subTextReg,
                                  ),
                                ],
                              )
                            ],
                          ),
                          Spacer(),
                          Row(
                            children: [
                              Text(
                                widget.event.name,
                                style: StyleConstants.titleTextBold,
                              ),
                              SizedBox(
                                width: width * 0.025,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Row(
                            children: [
                              Icon(Icons.location_on, size: 15.0),
                              Container(
                                width: width * 0.5,
                                child: Text(
                                  location,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: StyleConstants.subTextReg,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0.0,
                  left: width * 0.04,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Container(
                      height: width * 0.2,
                      width: width * 0.2,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.white),
                      // child: CachedNetworkImage(
                      //   imageUrl: currentScan.pet.image != null &&
                      //       currentScan.pet.image.isNotEmpty
                      //       ? currentScan.pet.image
                      //       : StyleConstants.defaultPetImageUrl,
                      child: Image(
                        image: organizer != null
                            ? Image.network(organizer!.profileUrl).image
                            : Image.network('https://firebasestorage.googleapis.com/v0/b/college-competitions.appspot.com/o/profilePictures%2FRectangle%20443.png?alt=media&token=a67e01cf-d7f2-4163-bd8d-5d9797743403').image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: height * 0.05),
      ],
    );
  }
}
