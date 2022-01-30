import 'package:college_competitions/models/Event.dart';
import 'package:college_competitions/screens/accept_event_screen.dart';
import 'package:college_competitions/utils/string_helper.dart';
import 'package:college_competitions/utils/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class EventCardWidget extends StatefulWidget {
  const EventCardWidget({Key? key, required this.event}) : super(key: key);

  final Event event;

  @override
  _EventCardWidgetState createState() => _EventCardWidgetState();
}

class _EventCardWidgetState extends State<EventCardWidget> {
  String location = '';

  double width = StyleConstants.width;
  double height = StyleConstants.height;

  @override
  void initState() {
    setLocation();
    super.initState();
  }

  Future<void> setLocation() async {
    location = await StringHelper().getLocationName(widget.event.location);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, new MaterialPageRoute(builder: (_) => AcceptEventScreen()));
      },
      child: Container(
        height: height * 0.25,
        width: width * 0.6,
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              widget.event.name,
              style: StyleConstants.medTextBold,
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Text(
              widget.event.description,
              style: StyleConstants.descTextReg,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 15.0,
                        color: StyleConstants.lightBlue,
                      ),
                      SizedBox(
                        width: width * 0.01,
                      ),
                      Container(
                        width: width * 0.3,
                        child: Text(
                          location,
                          style: StyleConstants.subTextReg
                              .copyWith(color: StyleConstants.lightBlue),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Container(
                  child: Row(
                    children: [
                      Icon(
                        Icons.people,
                        size: 15.0,
                        color: StyleConstants.lightBlue,
                      ),
                      SizedBox(
                        width: width * 0.01,
                      ),
                      Text(
                        widget.event.registered.length.toString() +
                            '/' +
                            widget.event.capacity.toString(),
                        style: StyleConstants.subTextReg
                            .copyWith(color: StyleConstants.lightBlue),
                      ),
                    ],
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
