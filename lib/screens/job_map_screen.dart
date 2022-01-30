import 'package:flutter/material.dart';

class JobMapScreen extends StatefulWidget {
  const JobMapScreen({Key? key}) : super(key: key);

  @override
  _JobMapScreenState createState() => _JobMapScreenState();
}

class _JobMapScreenState extends State<JobMapScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('job map'),
      ),
    );
  }
}
