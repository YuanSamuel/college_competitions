import 'package:college_competitions/screens/root_screen.dart';
import 'package:college_competitions/utils/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: StyleConstants.darkWhite,
          primarySwatch: Colors.blue,
      ),
      home: const RootScreen(),
    );
  }
}

