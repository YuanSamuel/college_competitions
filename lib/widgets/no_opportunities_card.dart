import 'package:college_competitions/utils/style_constants.dart';
import 'package:flutter/material.dart';

class NoOpportunitiesCard extends StatelessWidget {
  const NoOpportunitiesCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: StyleConstants.height * 0.25,
      width: StyleConstants.width * 0.6,
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
      child: const Center(
        child: Text('No Opportunities Found'),
      ),
    );
  }
}
