import 'package:college_competitions/firebase_options.dart';
import 'package:college_competitions/provider/auth_provider.dart';
import 'package:college_competitions/provider/colleges_provider.dart';
import 'package:college_competitions/provider/current_location_provider.dart';
import 'package:college_competitions/provider/map_provider.dart';
import 'package:college_competitions/screens/root_screen.dart';
import 'package:college_competitions/provider/events_provider.dart';
import 'package:college_competitions/provider/jobs_provider.dart';
import 'package:college_competitions/provider/user_provider.dart';
import 'package:college_competitions/utils/style_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProxyProvider<AuthProvider, UserProvider>(
            create: (_) => UserProvider(),
            update: (BuildContext context, AuthProvider authProvider,
                UserProvider? userProvider) {
              if (authProvider.loggedIn) {
                return UserProvider()
                  ..setUpListener(FirebaseAuth.instance.currentUser!.uid);
              } else {
                return UserProvider();
              }
            }),
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
        ChangeNotifierProvider(create: (_) => CollegesProvider()),
        ChangeNotifierProvider(create: (_) => CurrentLocationProvider()),
        ChangeNotifierProvider(create: (_) => MapProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: StyleConstants.darkWhite,
          primarySwatch: Colors.blue,
        ),
        home: const RootScreen(),
      ),
    );
  }
}
