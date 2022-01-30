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

class LeaderboardScreen extends StatefulWidget {
  const LeaderboardScreen({Key? key}) : super(key: key);

  @override
  _LeaderboardScreenState createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  double width = StyleConstants.width;
  double height = StyleConstants.height;

  late CollegesProvider collegesProvider;

  @override
  Widget build(BuildContext context) {
    collegesProvider = Provider.of<CollegesProvider>(context);

    return Scaffold(
      body: Container(
        color: StyleConstants.darkBlue,
        child: Column(
          children: [
            SizedBox(
              height: height * 0.02,
            ),
            Row(
              children: [
                Spacer(),
                IconButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                  },
                  icon: Icon(
                    Icons.account_circle,
                    color: StyleConstants.lightBlue,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  width: 20,
                ),
                FadeAnimationDown(
                  1,
                  Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 6,
                        height: MediaQuery.of(context).size.width / 6,
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 4,
                              color: StyleConstants.lightBlue,
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
                                image: NetworkImage(
                                    colleges[1].logoUrl))),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: StyleConstants.lightBlue,
                            ),
                            color: StyleConstants.lightBlue,
                          ),
                          child: Center(
                            child: Text(
                              "2nd",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                FadeAnimationDown(
                  0.8,
                  Stack(
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
                                image: NetworkImage(
                                    colleges[0].logoUrl))),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.yellowAccent.shade700,
                            ),
                            color: Colors.yellowAccent.shade700,
                          ),
                          child: Center(
                            child: Text(
                              "1st",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                FadeAnimationDown(
                  1.1,
                  Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 6,
                        height: MediaQuery.of(context).size.width / 6,
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 4,
                              color: new Color(0XFF987554),
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
                                image: NetworkImage(
                                    colleges[2].logoUrl))),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: new Color(0XFF987554),
                            ),
                            color: new Color(0XFF987554),
                          ),
                          child: Center(
                            child: Text(
                              "3rd",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
            SizedBox(
              height: height * 0.08,
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
                    child: _buildTopSchools()
                    ),
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
