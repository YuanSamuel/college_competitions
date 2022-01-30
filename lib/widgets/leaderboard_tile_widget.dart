import 'package:college_competitions/utils/style_constants.dart';
import 'package:flutter/material.dart';

class LeaderboardTileWidget extends StatelessWidget {
  const LeaderboardTileWidget({Key? key, required this.index}) : super(key: key);
  final int index;

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
                    "https://th.bing.com/th/id/R.71703b29799d2bed86e57011d2a6f5ef?rik=tMheKZ2MywPIHA&riu=http%3a%2f%2fwww.freelogovectors.net%2fwp-content%2fuploads%2f2020%2f10%2ftexas-a-m-aggies-logo.png&ehk=TUcnEMBRK6cHtvA0ZT4%2b7wfD%2fYOoOAF1%2fsQgNQJipRU%3d&risl=&pid=ImgRaw&r=0"),
              ),
            ),
          ),
          Text(
            "A&M University",
            style: TextStyle(
                color: StyleConstants.darkBlue,
                fontSize: 15
            ),
          ),
          SizedBox(width: 1,),
          Text(
            "45,000 points",
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
