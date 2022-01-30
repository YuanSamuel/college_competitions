import 'package:college_competitions/animations/FadeAnimationUp.dart';
import 'package:college_competitions/models/Event.dart';
import 'package:college_competitions/models/User.dart';
import 'package:college_competitions/provider/colleges_provider.dart';
import 'package:college_competitions/services/firebase_service.dart';
import 'package:college_competitions/utils/string_helper.dart';
import 'package:college_competitions/utils/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AcceptEventScreen extends StatefulWidget {
  const AcceptEventScreen({Key? key, required this.event}) : super(key: key);

  final Event event;

  @override
  _AcceptEventScreenState createState() => _AcceptEventScreenState();
}

class _AcceptEventScreenState extends State<AcceptEventScreen> {
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
    CollegesProvider collegesProvider = Provider.of<CollegesProvider>(context);

    return Scaffold(
      body: Container(
        height: height,
        width: width,
        child: Column(
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
                          'View Event',
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
              height: height * 0.8,
              width: width,
              color: StyleConstants.darkBlue,
              child: Container(
                height: height * 0.8,
                width: width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(40.0)),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: height * 0.05,),
                      FadeAnimationUp(
                          1.5,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.info_outline, color: StyleConstants.lightBlue,),
                              SizedBox(width: width * 0.05,),
                              Text(
                                widget.event.description,
                                style: StyleConstants.descTextReg,
                              ),
                            ],
                          )
                      ),
                      SizedBox(height: height * 0.02,),
                      FadeAnimationUp(
                          1.7,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.phone, color: StyleConstants.lightBlue,),
                              SizedBox(width: width * 0.05,),
                              Text(
                                organizer != null ? organizer!.phone : '',
                                style: StyleConstants.descTextReg,
                              ),
                            ],
                          )
                      ),
                      SizedBox(height: height * 0.02,),
                      FadeAnimationUp(
                          1.9,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.email_outlined, color: StyleConstants.lightBlue,),
                              SizedBox(width: width * 0.05,),
                              Text(
                                organizer != null ? organizer!.email : '',
                                style: StyleConstants.descTextReg,
                              ),
                            ],
                          )
                      ),
                      SizedBox(height: height * 0.02,),
                      FadeAnimationUp(
                          2.1,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.access_time_outlined, color: StyleConstants.lightBlue,),
                              SizedBox(width: width * 0.05,),
                              Text(
                                "${StringHelper().getTimeString(widget.event.date.toDate())} ${StringHelper().getDateString(widget.event.date.toDate())}",
                                style: StyleConstants.descTextReg,
                              ),
                            ],
                          )
                      ),
                      SizedBox(height: height * 0.02,),
                      FadeAnimationUp(
                          2.3,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.location_on, color: StyleConstants.lightBlue,),
                              SizedBox(width: width * 0.05,),
                              Text(
                                location,
                                style: StyleConstants.descTextReg,
                                maxLines: 5,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          )
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
