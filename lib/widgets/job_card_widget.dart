import 'package:college_competitions/models/Job.dart';
import 'package:college_competitions/utils/style_constants.dart';
import 'package:flutter/material.dart';

class JobCardWidget extends StatelessWidget {
  JobCardWidget({Key? key, required this.job}) : super(key: key);

  final Job job;

  double width = StyleConstants.width;
  double height = StyleConstants.height;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            job.name,
            style: StyleConstants.medTextBold,
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Text(
            job.description,
            style: StyleConstants.descTextReg,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          Spacer(),
          Row(
            children: [
              Icon(
                Icons.location_on,
                size: 15.0,
                color: StyleConstants.lightBlue,
              ),
              SizedBox(
                width: width * 0.01,
              ),
              Text(
                'Jester East',
                style: StyleConstants.subTextReg
                    .copyWith(color: StyleConstants.lightBlue),
              ),
              Spacer(),
              Icon(
                Icons.people,
                size: 15.0,
                color: StyleConstants.lightBlue,
              ),
              SizedBox(
                width: width * 0.01,
              ),
              Text(
                job.registered.length.toString() +
                    '/' +
                    job.capacity.toString(),
                style: StyleConstants.subTextReg
                    .copyWith(color: StyleConstants.lightBlue),
              ),
            ],
          )
        ],
      ),
    );
  }
}
