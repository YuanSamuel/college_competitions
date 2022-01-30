import 'package:college_competitions/animations/FadeAnimationDown.dart';
import 'package:flutter/material.dart';

class LeaderboardScreen extends StatefulWidget {
  const LeaderboardScreen({Key? key}) : super(key: key);

  @override
  _LeaderboardScreenState createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.cyan.shade800,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 30),
            child: Row(
              children: [
                Text(
                  "Top 3",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.height / 40,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
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
                            color: Colors.lightBlue.shade200,
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
                                  "https://i1.wp.com/www.essayhell.com/wp-content/uploads/2017/07/UTT_text_logo.svg_.png?ssl=1"))),
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
                            color: Colors.lightBlue.shade200,
                          ),
                          color: Colors.lightBlue.shade200,
                        ),
                        child: Center(
                          child: Text(
                            "2nd",
                            style: TextStyle(color: Colors.white, fontSize: 14),
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
                            color: Colors.yellowAccent.shade700,
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
                                  "https://th.bing.com/th/id/R.71703b29799d2bed86e57011d2a6f5ef?rik=tMheKZ2MywPIHA&riu=http%3a%2f%2fwww.freelogovectors.net%2fwp-content%2fuploads%2f2020%2f10%2ftexas-a-m-aggies-logo.png&ehk=TUcnEMBRK6cHtvA0ZT4%2b7wfD%2fYOoOAF1%2fsQgNQJipRU%3d&risl=&pid=ImgRaw&r=0"))),
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
                            style: TextStyle(color: Colors.white, fontSize: 18),
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
                            color: Colors.lightBlue.shade200,
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
                                  "https://i1.wp.com/www.essayhell.com/wp-content/uploads/2017/07/UTT_text_logo.svg_.png?ssl=1"))),
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
                            color: Colors.lightBlue.shade200,
                          ),
                          color: Colors.lightBlue.shade200,
                        ),
                        child: Center(
                          child: Text(
                            "2nd",
                            style: TextStyle(color: Colors.white, fontSize: 14),
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
          SizedBox(height: 50,),
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
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                offset: Offset(0, 2),
                                blurRadius: 4.0,
                              ),
                            ]),
                      ),
                      Text("Leaderboard", style: TextStyle(
                        fontSize: 30, color: Colors.cyan.shade900,
                      ),),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 50,
                            right: 50,
                            top: 40,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [BoxShadow (
                                blurRadius: 20,
                              spreadRadius: 20,
                              blurStyle: BlurStyle.outer,
                              color: Colors.grey.shade500
                                )
                            ],
                          ),
                            child: Row(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.lightBlueAccent.shade200
                                  ),
                                  child: Center(
                                    child: Text(
                                      "1st", style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white
                                    ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(

                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          "https://th.bing.com/th/id/R.71703b29799d2bed86e57011d2a6f5ef?rik=tMheKZ2MywPIHA&riu=http%3a%2f%2fwww.freelogovectors.net%2fwp-content%2fuploads%2f2020%2f10%2ftexas-a-m-aggies-logo.png&ehk=TUcnEMBRK6cHtvA0ZT4%2b7wfD%2fYOoOAF1%2fsQgNQJipRU%3d&risl=&pid=ImgRaw&r=0"
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                )),
          )),
        ],
      ),
    );
  }
}
