import 'package:college_competitions/models/College.dart';
import 'package:college_competitions/services/college_data_service.dart';
import 'package:flutter/material.dart';

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
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Center(
          child: TextButton(
            onPressed: () async {
              List<College> colleges = await CollegeDataService().getCollegeFromName("texas");
              CollegeDataService().getCollegeImage(colleges[0]);
              for (College college in colleges) {
                print(college.name);
                print(college.domains);
                print(college.logo);
              }
            },
            child: Text('Get Colleges'),
          ),
        ),
      ),
    );
  }
}