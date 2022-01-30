import 'dart:math';

import 'package:college_competitions/animations/FadeAnimationDown.dart';
import 'package:college_competitions/animations/FadeAnimationLeft.dart';
import 'package:college_competitions/models/College.dart';
import 'package:college_competitions/provider/colleges_provider.dart';
import 'package:college_competitions/utils/style_constants.dart';
import 'package:college_competitions/widgets/leaderboard_tile_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CollegeProfileScreen extends StatefulWidget {
  const CollegeProfileScreen({Key? key, required this.college}) : super(key: key);

  final College college;

  @override
  _CollegeProfileScreenState createState() => _CollegeProfileScreenState();
}

class _CollegeProfileScreenState extends State<CollegeProfileScreen> {
  double width = StyleConstants.width;
  double height = StyleConstants.height;

  late CollegesProvider collegesProvider;

  @override
  Widget build(BuildContext context) {
    collegesProvider = Provider.of<CollegesProvider>(context);

    List<College> colleges = [...collegesProvider.colleges!];
    colleges.sort((College collegeA, College collegeB) {
      return collegeB.points - collegeA.points;
    });

    return Scaffold(
      body: Container(
        color: StyleConstants.darkBlue,
        child: Column(
          children: [
            SizedBox(
              height: height * 0.02,
            ),
            Align(alignment: Alignment.centerLeft,child: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back, color: Colors.white,))),
            SizedBox(
              height: height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 4,
                  height: MediaQuery.of(context).size.width / 4,
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 4,
                        color: new Color(0XFFFFC74D),
                      ),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 5,
                          blurRadius: 10,
                          color: Colors.black.withOpacity(0.3),
                          offset: Offset(0, 10),
                        ),
                      ],
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.scaleDown,
                          image: NetworkImage(widget.college.logoUrl))),
                ),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
            SizedBox(height: height * 0.05,),
            Text(widget.college.name, style: StyleConstants.medTextBold.copyWith(color: Colors.white),),
            SizedBox(height: height * 0.02,),
            Text("${widget.college.points} pts", style: StyleConstants.medTextBold.copyWith(color: Colors.white),),
            SizedBox(
              height: height * 0.04,
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                  ),
                ),
                child: Padding(
                    padding: EdgeInsets.only(left: 15.0, top: height * 0.02),
                    child: _buildTopSchools()),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildTopSchools() {
    List<College> colleges = [...collegesProvider.colleges!];
    colleges.sort((College collegeA, College collegeB) {
      return collegeB.points - collegeA.points;
    });

    List<Widget> tiles = [];
    for (int i = 0; i < min(10, colleges.length); i++) {
      tiles.add(Text(colleges[i].name));
      tiles.add(SizedBox(
        height: height * 0.01,
      ));
    }

    return ListView.builder(
        itemCount: colleges.length,
        itemBuilder: (BuildContext context, int index) {
          return FadeAnimationLeft(
              1 + (index + 1) / 3.0,
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                ),
                child: LeaderboardTileWidget(
                  index: index + 1,
                  college: colleges[index],
                ),
              ));
        });
    // return Column(
    //   children: tiles,
    // );
  }
}
