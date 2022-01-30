import 'package:college_competitions/models/Event.dart';
import 'package:college_competitions/provider/events_provider.dart';
import 'package:college_competitions/utils/style_constants.dart';
import 'package:college_competitions/widgets/featured_event_widget.dart';
import 'package:college_competitions/widgets/no_opportunities_card.dart';
import 'package:college_competitions/widgets/upcoming_event_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  _EventsScreenState createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  double width = StyleConstants.width;
  double height = StyleConstants.height;

  var items = {'This week', 'This month', 'This year'};

  String dropDownInitVal = "This week";

  @override
  Widget build(BuildContext context) {
    EventsProvider eventsProvider = Provider.of<EventsProvider>(context);

    List<Event> sortedEvents = [...eventsProvider.allEvents];

    if (dropDownInitVal == 'This week') {
      sortedEvents = sortedEvents.where((Event event) => event.date.toDate().difference(DateTime.now()).inDays <= 7).toList();
    } else if (dropDownInitVal == 'This month') {
      sortedEvents = sortedEvents.where((Event event) => event.date.toDate().difference(DateTime.now()).inDays <= 31).toList();
    } else {
      sortedEvents = sortedEvents.where((Event event) => event.date.toDate().difference(DateTime.now()).inDays <= 365).toList();
    }

    sortedEvents.sort((Event eventA, Event eventB) {
      return eventA.date.compareTo(eventB.date);
    });

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: width,
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.07,
              ),
              Text(
                'Upcoming Events',
                style: StyleConstants.medTextBold,
              ),
              SizedBox(
                height: height * 0.02,
              ),
              eventsProvider.userEvents.isNotEmpty ? Container(
                height: height * 0.32,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: eventsProvider.userEvents.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: UpcomingEventWidget(
                        event: eventsProvider.userEvents[index],
                      ),
                    );
                  },
                  scrollDirection: Axis.horizontal,
                ),
              ) : const NoOpportunitiesCard(),
              SizedBox(
                height: height * 0.05,
              ),
              Row(
                children: [
                  Text(
                    'Featured Events',
                    style: StyleConstants.medTextBold,
                  ),
                  Spacer(),
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
                      });
                    },
                  )
                ],
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: sortedEvents.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: FeaturedEventWidget(event: sortedEvents[index],),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
