import 'package:college_competitions/animations/FadeAnimationUp.dart';
import 'package:college_competitions/utils/style_constants.dart';
import 'package:flutter/material.dart';

class AcceptJobScreen extends StatefulWidget {
  const AcceptJobScreen({Key? key}) : super(key: key);

  @override
  _AcceptJobScreenState createState() => _AcceptJobScreenState();
}

class _AcceptJobScreenState extends State<AcceptJobScreen> {
  double width = StyleConstants.width;
  double height = StyleConstants.height;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 40,
              ),
              FadeAnimationUp(
                0.8,
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.7,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueGrey.withOpacity(0.5),
                        spreadRadius: 6,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      FadeAnimationUp(
                        1,
                        Padding(
                          padding: const EdgeInsets.only(top: 25.0, bottom: 10),
                          child: Text(
                            "Vincent Yuan",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold,
                            color: StyleConstants.darkBlue),
                          ),
                        ),
                      ),
                      FadeAnimationUp(
                        1.1,
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Text(
                            "has an available job!",
                            style: TextStyle(fontSize: 20,
                            color: StyleConstants.darkBlue),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: 1,
                            ),
                            FadeAnimationUp(
                              1.2, ClipRRect(
                                borderRadius: BorderRadius.circular(100.0),
                                child: Container(
                                  child: Image(
                                    image: AssetImage('assets/profpic1.jpg'),
                                  ),
                                ),
                              ),
                            ),
                            FadeAnimationUp(1.3, Text("from")),
                            FadeAnimationUp(
                              1.4, ClipRRect(
                                borderRadius: BorderRadius.circular(100.0),
                                child: Container(
                                  height: 125,
                                  child: Image(
                                    fit: BoxFit.cover,
                                    image: AssetImage('assets/utlogo.png'),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 1,
                            )
                          ],
                        ),
                      ),
                      Center(
                          child: Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: FadeAnimationUp(
                          1.5, Text(
                            "I need someone to help me move out of my dorm! Please come and help me."
                                " I need someone strong and big to move big and heavy things.",
                            style: StyleConstants.descTextReg,
                          ),
                        ),
                      )),
                    ],
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * .05),
              FadeAnimationUp(
                1.6, Container(
                  width: MediaQuery.of(context).size.width * .8,
                  height: MediaQuery.of(context).size.height * .12,
                  decoration: BoxDecoration(
                      color: StyleConstants.darkBlue,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          color: Colors.grey.withOpacity(.3),
                          spreadRadius: 3,
                          offset: Offset(0, 3),
                        )
                      ]),
                  child: FadeAnimationUp(
                    1.7, Center(
                      child: Text(
                        "Accept",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FadeAnimationUp(
                1.8, Text("No, I can't make it.",
                    style: TextStyle(
                      fontSize: 15,
                      fontStyle: FontStyle.italic,
                      color: StyleConstants.darkBlue,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
