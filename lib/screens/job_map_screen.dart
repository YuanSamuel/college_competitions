import 'package:college_competitions/utils/style_constants.dart';
import 'package:college_competitions/widgets/job_map_widget.dart';
import 'package:flutter/material.dart';

class JobMapScreen extends StatefulWidget {
  const JobMapScreen({Key? key}) : super(key: key);

  @override
  _JobMapScreenState createState() => _JobMapScreenState();
}

class _JobMapScreenState extends State<JobMapScreen> {
  @override
  Widget build(BuildContext context) {

    double height = StyleConstants.height;
    double width = StyleConstants.width;

    return Scaffold(
        body: Column(
          children: [
            SizedBox(height: height * 0.4,),
            JobMapWidget(),
          ],
        )

    );
  }
}
