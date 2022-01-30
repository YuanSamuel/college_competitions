import 'package:college_competitions/models/College.dart';
import 'package:college_competitions/services/college_data_service.dart';
import 'package:college_competitions/utils/style_constants.dart';
import 'package:flutter/material.dart';

class PickCollegeModal extends StatefulWidget {
  const PickCollegeModal({Key? key}) : super(key: key);

  @override
  _PickCollegeModalState createState() => _PickCollegeModalState();
}

class _PickCollegeModalState extends State<PickCollegeModal> {
  TextEditingController _collegeNameInputController = TextEditingController();
  List<College> _collegeSuggestions = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: StyleConstants.height * 0.8,
      child: Column(
        children: [
          TextField(
            controller: _collegeNameInputController,
            decoration: const InputDecoration(hintText: 'College Name'),
            onChanged: (String name) async {
              if (name.length >= 3) {
                _collegeSuggestions =
                    await CollegeDataService().getCollegeFromName(name);
              } else {
                _collegeSuggestions = [];
              }

              setState(() {});
            },
          ),
          SingleChildScrollView(
            child: Column(
              children: _buildTiles(),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> _buildTiles() {
    List<Widget> tiles = [];
    for (College college in _collegeSuggestions) {
      tiles.add(ListTile(
        leading: college.logo != null
            ? Image.memory(college.logo!)
            : Image.asset('assets/no_profile_icon.png'),
        title: Text(college.name),
        onTap: () {
          Navigator.pop(context, college.name);
        },
      ));
    }
    return tiles;
  }
}
