import 'package:college_competitions/screens/dashboard_screen.dart';
import 'package:college_competitions/screens/events_screen.dart';
import 'package:college_competitions/screens/job_map_screen.dart';
import 'package:college_competitions/screens/leaderboard_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  _RootScreenState createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {

  int _selectedTab = 0;
  static const _pageOptions = [
    DashboardScreen(),
    JobMapScreen(),
    EventsScreen(),
    LeaderboardScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[_selectedTab],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black54,
                blurRadius: 5.0,
                offset: Offset(0.0, 0.75)
            )
          ],
          color: Colors.blue,
        ),
        child: CurvedNavigationBar(
          backgroundColor: Colors.grey.shade200,
          items: <Widget>[
            Icon(Icons.calendar_today, size: 30),
            Icon(Icons.insert_chart, size: 30),
            Icon(Icons.people, size: 30),
            Icon(Icons.person_pin, size: 30),
          ],
          onTap: (index) {
            setState(() {
              _selectedTab = index;
            });
          },
        ),
      ),
    );
  }
}
