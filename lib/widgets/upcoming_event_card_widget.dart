import 'package:college_competitions/models/Event.dart';
import 'package:college_competitions/utils/style_constants.dart';
import 'package:flutter/material.dart';

class UpcomingEventWidget extends StatelessWidget {
  UpcomingEventWidget({Key? key, required this.event}) : super(key: key);

  final Event event;

  double width = StyleConstants.width;
  double height = StyleConstants.height;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    'Social',
                    style:
                        StyleConstants.subTextReg.copyWith(color: Colors.white),
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
                'in 2 hours',
                style: StyleConstants.subTextReg
                    .copyWith(color: StyleConstants.lightBlue),
              )
            ],
          ),
          SizedBox(height: height * 0.02,),

          Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    size: 15.0,
                    color: StyleConstants.lightBlue,
                  ),
                  Text(
                    ' Jester East',
                    style: StyleConstants.subTextReg
                        .copyWith(color: StyleConstants.lightBlue),
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
                    ' ' + event.registered.length.toString() + '/' + event.capacity.toString(),
                    style: StyleConstants.subTextReg
                        .copyWith(color: StyleConstants.lightBlue),
                  )
                ],
              ),
            ],
          ),
          SizedBox(height: height * 0.02,),
          Text(
            event.description,
            style: StyleConstants.descTextReg,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          Spacer(),
          Text(
            event.name,
            style: StyleConstants.medTextBold,
          )
        ],
      ),
    );
  }
}
