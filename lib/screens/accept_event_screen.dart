import 'package:college_competitions/animations/FadeAnimationUp.dart';
import 'package:college_competitions/utils/style_constants.dart';
import 'package:flutter/material.dart';

class AcceptEventScreen extends StatefulWidget {
  const AcceptEventScreen({Key? key}) : super(key: key);

  @override
  _AcceptEventScreenState createState() => _AcceptEventScreenState();
}

class _AcceptEventScreenState extends State<AcceptEventScreen> {
  double width = StyleConstants.width;
  double height = StyleConstants.height;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        child: Column(
          children: [
            Container(
              height: height * 0.2,
              width: width,
              color: Colors.white,
              child: Container(
                width: width,
                height: height * 0.2,
                decoration: BoxDecoration(
                  color: StyleConstants.darkBlue,
                  borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(40.0)),
                ),
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Container(
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: width * 0.1,
                        ),
                        Text(
                          'View Event',
                          style: StyleConstants.medTextBold
                              .copyWith(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: height * 0.8,
              width: width,
              color: StyleConstants.darkBlue,
              child: Container(
                height: height * 0.8,
                width: width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                  BorderRadius.only(topLeft: Radius.circular(40.0)),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      FadeAnimationUp(
                        0.8,
                        Column(
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
                      SizedBox(height: height * .03),
                      FadeAnimationUp(
                        1.6, GestureDetector(
                        onTap: (){Navigator.pop(context);},
                          child: Container(
                          width: width * .8,
                          height: height * .08,
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
                              style: StyleConstants.medTextReg.copyWith(color: Colors.white),
                            ),
                          ),
                          ),
                      ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),


                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
