import 'package:college_competitions/utils/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class CreateEventScreen extends StatefulWidget {
  const CreateEventScreen({Key? key}) : super(key: key);

  @override
  _CreateEventScreenState createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  //TODO : Has to be fixed with different categories
  var categories = {'Social 1', 'Social 2', 'Social 3'};

  var numPeopleRequired = {
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '10+'
  };

  String dropDownInitVal2 = '1';

  String dropDownInitVal = "Social 1";

  double width = StyleConstants.width;
  double height = StyleConstants.height;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: height,
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: height * 0.2,
                width: width,
                color: Colors.white,
                child: Container(
                  width: width,
                  height: height * 0.2,
                  decoration: BoxDecoration(
                    color: StyleConstants.darkBlue,
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(40.0)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Container(
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: width * 0.1,
                          ),
                          Text(
                            'Create Event',
                            style: StyleConstants.medTextBold
                                .copyWith(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: height * 0.8,
                width: width,
                color: StyleConstants.darkBlue,
                child: Container(
                  height: height * 0.8,
                  width: width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(40.0)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                    child: Column(
                      children: [
                        SizedBox(
                          height: height * 0.05,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter event title',
                          ),
                        ),
                        SizedBox(height: height * 0.04,),
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter event description',
                          ),
                        ),
                        SizedBox(height: height * 0.04,),

                        TextButton(
                            onPressed: () {
                              DatePicker.showDatePicker(context,
                                  showTitleActions: true,
                                  minTime: DateTime(2022, 1, 1),
                                  maxTime: DateTime(2030, 12, 31),
                                  onChanged: (date) {
                                print('change $date');
                              }, onConfirm: (date) {
                                print('confirm $date');
                              },
                                  currentTime: DateTime.now(),
                                  locale: LocaleType.zh);
                            },
                            child: Text(
                              'Pick date & time',
                              style: TextStyle(color: Colors.blue),
                            ),),
                        SizedBox(height: height * 0.02,),
                        DropdownButton(
                          value: dropDownInitVal,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: categories.map((String items) {
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
                        ),
                        SizedBox(height: height * 0.04,),

                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter location',
                          ),
                        ),
                        SizedBox(height: height * 0.04,),
                        Text('Number Required', style: StyleConstants.medTextReg,),
                        DropdownButton(
                          value: dropDownInitVal2,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: numPeopleRequired.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropDownInitVal2 = newValue!;
                            });
                          },
                        ),
                        GestureDetector(
                          onTap: ()  {
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: height * 0.07,
                            width: width * 0.9,
                            decoration: BoxDecoration(
                              color: StyleConstants.darkBlue,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Center(
                              child: Text(
                                'Complete',
                                style: StyleConstants.medTextBold
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                        ),

                        // ElevatedButton(
                        //   onPressed: () {
                        //     Navigator.pop(context);
                        //   },
                        //   child: Text("Create Event"),
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
