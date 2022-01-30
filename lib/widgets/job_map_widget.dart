import 'package:college_competitions/models/Job.dart';
import 'package:college_competitions/models/User.dart';
import 'package:college_competitions/screens/accept_job_screen.dart';
import 'package:college_competitions/services/firebase_service.dart';
import 'package:college_competitions/utils/string_helper.dart';
import 'package:college_competitions/utils/style_constants.dart';
import 'package:flutter/material.dart';

class JobMapWidget extends StatefulWidget {
  const JobMapWidget({Key? key, required this.job}) : super(key: key);

  final Job job;

  @override
  _JobMapWidgetState createState() => _JobMapWidgetState();
}

class _JobMapWidgetState extends State<JobMapWidget> {
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
    organizer = await FirebaseService().getOrganizer(widget.job.organizerId);
    location = await StringHelper().getLocationName(widget.job.location);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => AcceptJobScreen(job: widget.job),
            ),
          );
        },
        child: Container(
          width: width * 0.8,
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
                                    StringHelper()
                                        .getDateString(widget.job.date.toDate()),
                                    style: StyleConstants.subTextReg,
                                  ),
                                ),
                                Text(
                                  StringHelper()
                                      .getTimeString(widget.job.date.toDate()),
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
                              widget.job.name,
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
                          : Image.network(
                                  'https://firebasestorage.googleapis.com/v0/b/college-competitions.appspot.com/o/profilePictures%2FRectangle%20443.png?alt=media&token=a67e01cf-d7f2-4163-bd8d-5d9797743403')
                              .image,
                      fit: BoxFit.cover,
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
