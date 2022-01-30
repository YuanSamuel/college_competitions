import 'package:college_competitions/screens/create_event_screen.dart';
import 'package:college_competitions/utils/style_constants.dart';
import 'package:college_competitions/widgets/event_card_widget.dart';
import 'package:college_competitions/widgets/job_card_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  double width = StyleConstants.width;
  double height = StyleConstants.height;


  @override
  Widget build(BuildContext context) {
  return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: StyleConstants.darkBlue,
        onPressed: (){
          Navigator.push(context, new MaterialPageRoute(builder: (_) => CreateEventScreen()));
        },
        child: Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.1,),
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
                                  foregroundImage: AssetImage('assets/profpic1.jpg'),
                                  radius: width * 0.15,
                                ),
                                Positioned(
                                  bottom: 0.0,
                                    right: 0.0,
                                    child: CircleAvatar(
                                      backgroundImage: AssetImage('assets/utlogo.png'),
                                      radius: width * 0.05,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: width * 0.04,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Vincent Yuan', style: StyleConstants.titleTextReg),
                                Text('UT Austin', style: StyleConstants.descTextReg),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('500/1200', style: StyleConstants.subTextReg),
                            SizedBox(height: height * 0.01,),
                            LinearProgressIndicator(
                              value: 0.7,
                              valueColor: new AlwaysStoppedAnimation(StyleConstants.lightBlack),
                              backgroundColor: StyleConstants.lightBlack.withOpacity(0.5),
                            ),
                            SizedBox(height: height * 0.01,),
                            Text('Level 10', style: StyleConstants.subTextReg),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: height * 0.05,),
                Text('Your Jobs and Events', style: StyleConstants.medTextBold,),
                SizedBox(height: height * 0.02,),
                Container(
                  height: height * 0.25,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: JobCardWidget(),
                      ),
                      SizedBox(width: width * 0.05,),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: JobCardWidget(),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: height * 0.05,),
                Text('Featured Jobs and Events', style: StyleConstants.medTextBold,),
                SizedBox(height: height * 0.02,),
                Container(
                  height: height * 0.25,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: EventCardWidget(),
                      ),
                      SizedBox(width: width * 0.05,),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: EventCardWidget(),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.05,),
                Text('Top 10 Schools', style: StyleConstants.medTextBold,),
                SizedBox(height: height * 0.3,),
                ElevatedButton(onPressed: (){FirebaseAuth.instance.signOut();}, child: Text('log out')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
