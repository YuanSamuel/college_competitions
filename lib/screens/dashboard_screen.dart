import 'package:college_competitions/utils/style_constants.dart';
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
  Widget build(BuildContext context) {  print("${width} ${height}");
  return Scaffold(
      body: Container(
        height: height,
        width: width,
        child: Column(
          children: [
            SizedBox(height: height * 0.1,),
            Container(
              height: height * 0.3,
              width: width * 0.9,
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
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
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/profpic1.jpg'),
                        radius: width * 0.15,
                      ),
                      SizedBox(width: width * 0.04,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Vincent Yuan', style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.normal),),
                          Text('UT Austin', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.normal),),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text('500/1200'),
                      LinearProgressIndicator(
                        value: 0.7,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
