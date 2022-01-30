import 'package:college_competitions/utils/style_constants.dart';
import 'package:flutter/material.dart';

class UpComingEventWidget extends StatelessWidget {
  UpComingEventWidget({Key? key}) : super(key: key);


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
          Row(
            children: [
              // Icon should be replaced with sth similar to FloatingActionButton.extend
              //Icon(Icons., size: 15.0, color: StyleConstants.lightBlue,),
              Spacer(),
              Icon(Icons.access_time_rounded, size: 15.0, color: StyleConstants.lightBlue,),
              SizedBox(width: width * 0.01,),
              Text('in 2 hours', style: StyleConstants.subTextReg.copyWith(color: StyleConstants.lightBlue),)
            ],
          ),

          Text('Jester East', style: StyleConstants.subTextReg.copyWith(color: StyleConstants.lightBlue),),
          SizedBox(height: height * 0.02,),
          Row(
            children: [
              Icon(Icons.people, size: 15.0, color: StyleConstants.lightBlue,),
              SizedBox(width: width * 0.01,),
              Text('6/12', style: StyleConstants.subTextReg.copyWith(color: StyleConstants.lightBlue),)
            ],
          ),
          Text("Join us in helping keep our campus clean! Spots limited so sign up soon...", style: StyleConstants.descTextReg,),
          Spacer(),
          Text('Clean Up Campus', style: StyleConstants.medTextBold,)
        ],
      ),
    );
  }
}