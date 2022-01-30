import 'package:college_competitions/provider/auth_provider.dart';
import 'package:college_competitions/provider/user_provider.dart';
import 'package:college_competitions/screens/dashboard_screen.dart';
import 'package:college_competitions/screens/events_screen.dart';
import 'package:college_competitions/screens/job_map_screen.dart';
import 'package:college_competitions/screens/leaderboard_screen.dart';
import 'package:college_competitions/screens/login_screen.dart';
import 'package:college_competitions/utils/style_constants.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    FirebaseAuth.instance.signOut();
    if (StyleConstants.height == 0) {
      StyleConstants().init(context);
    }

    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    if (!authProvider.loggedIn) {
      return const LoginScreen();
    } else {
      return Scaffold(
        body: _pageOptions[_selectedTab],
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black54,
                  blurRadius: 5.0,
                  offset: Offset(0.0, 0.75))
            ],
            color: Colors.blue,
          ),
          child: CurvedNavigationBar(
            backgroundColor: Colors.grey.shade200,
            items: const <Widget>[
              Icon(Icons.home, size: 30),
              Icon(Icons.map, size: 30),
              Icon(Icons.calendar_today, size: 30),
              Icon(Icons.insert_chart, size: 30),
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
}
