import 'package:college_competitions/provider/events_provider.dart';
import 'package:college_competitions/provider/jobs_provider.dart';
import 'package:college_competitions/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProxyProvider<UserProvider, EventsProvider>(
          create: (_) => EventsProvider(),
          update: (BuildContext context, UserProvider userProvider,
              EventsProvider? eventsProvider) {
            eventsProvider = EventsProvider();
            if (userProvider.user != null) {
              eventsProvider.setUpListeners(userProvider.user!);
            }
            return eventsProvider;
          },
        ),
        ChangeNotifierProxyProvider<UserProvider, JobsProvider>(
          create: (_) => JobsProvider(),
          update: (BuildContext context, UserProvider userProvider,
              JobsProvider? jobsProvider) {
            jobsProvider = JobsProvider();
            if (userProvider.user != null) {
              jobsProvider.setUpListeners(userProvider.user!);
            }
            return jobsProvider;
          },
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(),
      ),
    );
  }
}
