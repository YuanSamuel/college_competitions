import 'package:college_competitions/models/Event.dart';
import 'package:college_competitions/utils/string_helper.dart';
import 'package:college_competitions/utils/style_constants.dart';
import 'package:flutter/material.dart';

class FeaturedEventWidget extends StatelessWidget {
  FeaturedEventWidget({Key? key, required this.event}) : super(key: key);

  final Event event;

  double width = StyleConstants.width;
  double height = StyleConstants.height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.20,
      width: width * 0.80,
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        // Took out box shadow
        /*
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],*/
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              //Container for blue circle
              Spacer(),
              Spacer(),
              Icon(Icons.access_time_rounded, size: 15.0, color: StyleConstants.lightBlue,),
              SizedBox(width: width * 0.01,),
              Text(StringHelper().getDateString(event.date.toDate()), style: StyleConstants.subTextReg.copyWith(color: StyleConstants.lightBlue),)
            ],
          ),
          Text(event.name, style: StyleConstants.medTextBold,),
          SizedBox(height: height * 0.02,),

          Text(event.description, style: StyleConstants.subTextReg,),
          SizedBox(height: height * 0.02,),

          Row(
            children: [
              Icon(Icons.location_on, size: 15.0, color: StyleConstants.lightBlue,),
              SizedBox(width: width * 0.01,),
              Text('Jester East', style: StyleConstants.subTextReg.copyWith(color: StyleConstants.lightBlue),),
              Spacer(),
              Spacer(),
              Icon(Icons.people, size: 15.0, color: StyleConstants.lightBlue,),
              SizedBox(width: width * 0.01,),
              Text(event.registered.length.toString() + '/' + event.capacity.toString(), style: StyleConstants.subTextReg.copyWith(color: StyleConstants.lightBlue),)
            ],
          ),
        ],
      ),
    );
  }
}
