import 'package:college_competitions/models/Job.dart';
import 'package:college_competitions/screens/accept_job_screen.dart';
import 'package:college_competitions/utils/string_helper.dart';
import 'package:college_competitions/utils/style_constants.dart';
import 'package:flutter/material.dart';

class JobCardWidget extends StatefulWidget {
  const JobCardWidget({Key? key, required this.job}) : super(key: key);

  final Job job;

  @override
  _JobCardWidgetState createState() => _JobCardWidgetState();
}

class _JobCardWidgetState extends State<JobCardWidget> {
  String location = '';

  double width = StyleConstants.width;
  double height = StyleConstants.height;

  @override
  void initState() {
    setLocation();
    super.initState();
  }

  Future<void> setLocation() async {
    location = await StringHelper().getLocationName(widget.job.location);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, new MaterialPageRoute(builder: (_) => AcceptJobScreen(job: widget.job,)));
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
            Container(
              width: width * 0.25,
              height: height * 0.035,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Center(
                child: Text(
                  widget.job.interests.isNotEmpty ? widget.job.interests[0] : 'None',
                  style: StyleConstants.subTextReg
                      .copyWith(color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Text(
              widget.job.name,
              style: StyleConstants.medTextBold,
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Text(
              widget.job.description,
              style: StyleConstants.descTextReg,
              maxLines: 2,
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
                        widget.job.registered.length.toString() +
                            '/' +
                            widget.job.capacity.toString(),
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
