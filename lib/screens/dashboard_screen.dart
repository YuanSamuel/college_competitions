import 'dart:math';

import 'package:college_competitions/animations/FadeAnimationLeft.dart';
import 'package:college_competitions/models/College.dart';
import 'package:college_competitions/models/Event.dart';
import 'package:college_competitions/models/Job.dart';
import 'package:college_competitions/provider/colleges_provider.dart';
import 'package:college_competitions/provider/events_provider.dart';
import 'package:college_competitions/provider/jobs_provider.dart';
import 'package:college_competitions/provider/user_provider.dart';
import 'package:college_competitions/screens/create_job_screen.dart';
import 'package:college_competitions/services/user_service.dart';
import 'package:college_competitions/utils/style_constants.dart';
import 'package:college_competitions/widgets/ActionButton.dart';
import 'package:college_competitions/widgets/ExpandableFab.dart';
import 'package:college_competitions/widgets/event_card_widget.dart';
import 'package:college_competitions/widgets/job_card_widget.dart';
import 'package:college_competitions/widgets/leaderboard_tile_widget.dart';
import 'package:college_competitions/widgets/no_opportunities_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'create_event_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  static const _actionTitles = ['Create Event', 'Create Job'];

  double width = StyleConstants.width;
  double height = StyleConstants.height;

  late UserProvider userProvider;
  late CollegesProvider collegesProvider;
  late JobsProvider jobsProvider;
  late EventsProvider eventsProvider;

  @override
  Widget build(BuildContext context) {
    userProvider = Provider.of<UserProvider>(context);
    collegesProvider = Provider.of<CollegesProvider>(context);
    jobsProvider = Provider.of<JobsProvider>(context);
    eventsProvider = Provider.of<EventsProvider>(context);

    if (userProvider.user != null) {
    List<int> userLevel = UserService().getLevel(userProvider.user!.points);

    return Scaffold(
      floatingActionButton: ExpandableFab(
        children: [
          // Create event page
          ActionButton(
            onPressed: () {
              Navigator.push(context, new MaterialPageRoute(builder: (_) => CreateEventScreen()));
            },
            icon: const Icon(Icons.event),
          ),
          // Create job page
          ActionButton(
            onPressed: () {
              Navigator.push(context, new MaterialPageRoute(builder: (_) => CreateJobScreen()));
            },
            icon: const Icon(Icons.emoji_people),
          ),
        ],
        distance: 110.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.1,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: height * 0.3,
                    width: width * 0.9,
                    padding: EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 6,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Stack(
                              children: [
                                CircleAvatar(
                                  foregroundImage:
                                      userProvider.user!.profileUrl.isNotEmpty
                                          ? Image.network(
                                                  userProvider.user!.profileUrl)
                                              .image
                                          : Image.asset('assets/profpic1.jpg')
                                              .image,
                                  radius: width * 0.15,
                                ),
                                Positioned(
                                  bottom: 0.0,
                                  right: 0.0,
                                  child: CircleAvatar(
                                    foregroundImage: Image.network(UserService()
                                            .getUserCollege(userProvider.user!,
                                                collegesProvider.colleges!)
                                            .logoUrl)
                                        .image,
                                    radius: width * 0.04,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: width * 0.04,
                            ),
                            Container(
                              width: width * 0.4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(userProvider.user!.name,
                                      style: StyleConstants.titleTextReg, overflow: TextOverflow.ellipsis,),
                                  Text(userProvider.user!.college,
                                      style: StyleConstants.descTextReg, overflow: TextOverflow.ellipsis,),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                userLevel[1].toString() +
                                    '/' +
                                    userLevel[2].toString(),
                                style: StyleConstants.subTextReg),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            LinearProgressIndicator(
                              value: userLevel[1] / userLevel[2],
                              valueColor: AlwaysStoppedAnimation(
                                  StyleConstants.lightBlack),
                              backgroundColor:
                                  StyleConstants.lightBlack.withOpacity(0.5),
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Text('Level ' + userLevel[0].toString(),
                                style: StyleConstants.subTextReg),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Text(
                  'Your Jobs and Events',
                  style: StyleConstants.medTextBold,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Container(
                  height: height * 0.25,
                  child: _buildUserOpportunities(),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Text(
                  'Featured Jobs and Events',
                  style: StyleConstants.medTextBold,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Container(
                  height: height * 0.25,
                  child: _buildAllOpportunities(),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Text(
                  'Top 10 Schools',
                  style: StyleConstants.medTextBold,
                ),
                Container(
                    height: height * 0.5,
                    child: _buildTopSchools()),
              ],
            ),
          ),
        ),
      ),
    );} else {
      return const Scaffold();
    }
  }



  Widget _buildUserOpportunities() {
    List<Widget> cards = [];

    for (Job job in jobsProvider.userJobs) {
      cards.add(Padding(
        padding: const EdgeInsets.all(10.0),
        child: JobCardWidget(job: job),
      ));
      cards.add(
        SizedBox(
          width: width * 0.05,
        ),
      );
    }
    for (Event event in eventsProvider.userEvents) {
      cards.add(Padding(
        padding: const EdgeInsets.all(10.0),
        child: EventCardWidget(event: event),
      ));
      cards.add(
        SizedBox(
          width: width * 0.05,
        ),
      );
    }

    if (cards.isEmpty) {
      cards.add(const NoOpportunitiesCard());
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: cards,
      ),
    );
  }

  Widget _buildAllOpportunities() {
    List<Widget> cards = [];

    for (Job job in jobsProvider.allJobs) {
      cards.add(Padding(
        padding: const EdgeInsets.all(10.0),
        child: JobCardWidget(job: job),
      ));
      cards.add(
        SizedBox(
          width: width * 0.05,
        ),
      );
    }
    for (Event event in eventsProvider.allEvents) {
      cards.add(Padding(
        padding: const EdgeInsets.all(10.0),
        child: EventCardWidget(event: event),
      ));
      cards.add(
        SizedBox(
          width: width * 0.05,
        ),
      );
    }

    if (cards.isEmpty) {
      cards.add(const NoOpportunitiesCard());
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: cards,
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
                  right: 10,
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
