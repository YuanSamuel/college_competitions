import 'package:college_competitions/animations/FadeAnimationDown.dart';
import 'package:college_competitions/animations/FadeAnimationLeft.dart';
import 'package:college_competitions/utils/style_constants.dart';
import 'package:flutter/material.dart';

class LeaderboardScreen extends StatefulWidget {
  const LeaderboardScreen({Key? key}) : super(key: key);

  @override
  _LeaderboardScreenState createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: StyleConstants.darkBlue,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 30),
            ),
            SizedBox(
              height: 50,
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
                              color: StyleConstants.lightBlue,
                            ),
                            color: StyleConstants.lightBlue,
                          ),
                          child: Center(
                            child: Text(
                              "2nd",
                              style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
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
                              style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
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
                                color: new Color(0XFF987554),
                            ),
                              color: new Color(0XFF987554),
                          ),
                          child: Center(
                            child: Text(
                              "3rd",
                              style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
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
              height: 50,
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
                        FadeAnimationLeft(1, Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 20,),
                            Text("Leaderboard", style: TextStyle(
                               fontSize: 23,
                              color: StyleConstants.darkBlue
                            )),
                          ],
                        )),
                        SizedBox(
                          height: 20,
                        ),
                        FadeAnimationLeft(
                          1.3, Padding(
                            padding: const EdgeInsets.only(
                              left: 10,
                              right: 10,
                            ),
                            child: Container(
                              height: 70,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: StyleConstants.lightGrey),
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
                                        "1st",
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
                            ),
                          ),
                        ),
                        FadeAnimationLeft(
                          1.6, Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          child: Container(
                            height: 70,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
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
                                      "1st",
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
                                          "https://i1.wp.com/www.essayhell.com/wp-content/uploads/2017/07/UTT_text_logo.svg_.png?ssl=1"),
                                    ),
                                  ),
                                ),
                                Text(
                                  "UT Austin",
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
                          ),
                        ),
                        ),
                        FadeAnimationLeft(
                          1.9, Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          child: Container(
                            height: 70,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: StyleConstants.lightGrey),
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
                                      "1st",
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
                                  "UT Austin",
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
                          ),
                        ),
                        ),
                        FadeAnimationLeft(
                          2.2, Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          child: Container(
                            height: 70,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white),
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
                                      "1st",
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
                                  "UT Austin",
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
                          ),
                        ),
                        ),
                        FadeAnimationLeft(
                          2.5, Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          child: Container(
                            height: 70,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: StyleConstants.lightGrey),
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
                                      "1st",
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
                                  "UT Austin",
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
                          ),
                        ),
                        ),
                      ],
                    ),
                  )),
            )),
          ],
        ),
      ),
    );
  }
}
