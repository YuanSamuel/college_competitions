import 'package:college_competitions/models/College.dart';
import 'package:college_competitions/provider/colleges_provider.dart';
import 'package:college_competitions/utils/style_constants.dart';
import 'package:flutter/material.dart';

class LeaderboardTileWidget extends StatelessWidget {
  const LeaderboardTileWidget({Key? key, required this.index, required this.college}) : super(key: key);
  final int index;
  final College college;


  @override
  Widget build(BuildContext context) {
    double width = StyleConstants.width;
    double height = StyleConstants.height;


    return Container(
      height: 70,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: index % 2 == 0 ? Colors.white : StyleConstants.lightGrey
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.lightBlueAccent.shade200),
            child: Center(
              child: Text(
                index == 1 ? "1st" : index == 2 ? "2nd" : index == 3 ? "3rd" : "${index}",
                style: TextStyle(
                    fontSize: 15, color: StyleConstants.lightGrey),
              ),
            ),
          ),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 2,
                    spreadRadius: 2,
                    offset: Offset(0,1)
                )
              ],
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  college.logoUrl,
                ),
              ),
            ),
          ),
          Text(
            // "A&M University",
            college.name,
            style: TextStyle(
                color: StyleConstants.darkBlue,
                fontSize: 15
            ),
          ),
          SizedBox(width: 1,),
          Text(
            // "45,000 points",
            "${college.points}",
            style: TextStyle(
                color: StyleConstants.lightBlue,
                fontSize: 15
            ),
          )
        ],
      ),
    );
  }
}