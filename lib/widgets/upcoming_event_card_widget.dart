import 'package:college_competitions/models/Event.dart';
import 'package:college_competitions/screens/accept_event_screen.dart';
import 'package:college_competitions/utils/string_helper.dart';
import 'package:college_competitions/utils/style_constants.dart';
import 'package:flutter/material.dart';

class UpcomingEventWidget extends StatefulWidget {
  const UpcomingEventWidget({Key? key, required this.event}) : super(key: key);

  final Event event;

  @override
  _UpcomingEventWidgetState createState() => _UpcomingEventWidgetState();
}

class _UpcomingEventWidgetState extends State<UpcomingEventWidget> {
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
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => AcceptEventScreen(event: widget.event),
          ),
        );
      },
      child: Container(
        height: height * 0.32,
        width: width * 0.6,
        padding: EdgeInsets.all(10.0),
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
            Row(
              children: [
                // Icon should be replaced with sth similar to FloatingActionButton.extend
                //Icon(Icons., size: 15.0, color: StyleConstants.lightBlue,),
                Container(
                  width: width * 0.2,
                  height: height * 0.035,
                  decoration: BoxDecoration(
                    color: StyleConstants.lightBlue,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                    child: Text(
                      widget.event.interests.isNotEmpty ? widget.event.interests[0] : 'None',
                      style: StyleConstants.subTextReg
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.access_time_rounded,
                  size: 15.0,
                  color: StyleConstants.lightBlue,
                ),
                SizedBox(
                  width: width * 0.01,
                ),
                Text(
                  StringHelper().getTimeDifference(widget.event.date.toDate()),
                  style: StyleConstants.subTextReg
                      .copyWith(color: StyleConstants.lightBlue),
                )
              ],
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 15.0,
                      color: StyleConstants.lightBlue,
                    ),
                    Container(
                      width: width * 0.5,
                      child: Text(
                        ' ' + location,
                        style: StyleConstants.subTextReg.copyWith(
                            color: StyleConstants.lightBlue,
                            overflow: TextOverflow.ellipsis),
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
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
                      ' ' +
                          widget.event.registered.length.toString() +
                          '/' +
                          widget.event.capacity.toString(),
                      style: StyleConstants.subTextReg
                          .copyWith(color: StyleConstants.lightBlue),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Container(
              width: width * 0.5,
              child: Text(
                widget.event.description,
                style: StyleConstants.descTextReg,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Spacer(),
            Text(
              widget.event.name,
              style: StyleConstants.medTextBold,
            )
          ],
        ),
      ),
    );
  }
}
