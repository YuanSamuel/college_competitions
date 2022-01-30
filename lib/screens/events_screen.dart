import 'package:college_competitions/utils/style_constants.dart';
import 'package:college_competitions/widgets/featured_event_widget.dart';
import 'package:college_competitions/widgets/upcoming_event_card_widget.dart';
import 'package:flutter/material.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  _EventsScreenState createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  double width = StyleConstants.width;
  double height = StyleConstants.height;

  var items = {
    'This week',
    'This month',
    'This year'
  };

  String dropDownInitVal = "This week";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: height,
          width: width,
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.05,),
              Text('Upcoming Events', style: StyleConstants.medTextBold,),
              SizedBox(height: height * 0.02,),
            Container(
              height: height * 0.32,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: UpcomingEventWidget(),
                  ),
                ],
              ),
            ),
              SizedBox(height: height * 0.05,),
              Row(
                children: [
                  Text('Featured Events', style: StyleConstants.medTextBold,),
                  Spacer(),
                  Text('This Week', style: StyleConstants.subTextReg,),
                  SizedBox(width: width * 0.01,),
                  DropdownButton(
                    value: dropDownInitVal,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropDownInitVal = newValue!;
                      });},
                  )
                ],
              ),
              Container(
                height: height * 0.6,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: FeaturedEventWidget(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
