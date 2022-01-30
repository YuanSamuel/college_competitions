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
  var categories = {
    'Social',
    'Social 2',
    'Social 3'
  };

  var numPeopleRequired = {
    '1','2','3','4','5','6','7','8','9','10','10+'
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
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter event title',
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter event description',
                ),
              ),
              TextButton(
                onPressed: () {
                DatePicker.showDatePicker(context,
                showTitleActions: true,
                minTime: DateTime(2022, 1, 1),
                maxTime: DateTime(2030, 12, 31),
                    onChanged: (date) {
                      print('change $date');
                    },
                    onConfirm: (date) {
                      print('confirm $date');
                    },
                    currentTime: DateTime.now(), locale: LocaleType.zh);
                },
               child: Text(
                  'Pick date & time',
              style: TextStyle(color: Colors.blue),
              )),
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
                  });},
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter location',
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter location',
                ),
              ),
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
                  });},
              ),
              ElevatedButton (
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Create Event")
              )
            ],
          ),
        ),
      ),
    );
  }
}