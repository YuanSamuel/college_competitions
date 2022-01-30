import 'package:college_competitions/models/ChooseCollege.dart';
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
  List<ChooseCollege> _collegeSuggestions = [];

  double width = StyleConstants.width;
  double height = StyleConstants.height;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
      child: Container(
        height: StyleConstants.height * 0.8,
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: height * 0.01,),
            Container(
              width: width * 0.2,
              child: Divider(
                thickness: 5.0,
                color: StyleConstants.lightBlack,
              ),
            ),
            SizedBox(
              height: height * 0.05,
            ),
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
            Expanded(
              child: ListView(
                children: _buildTiles(),
              ),
            ),
            // SingleChildScrollView(
            //   child: Column(
            //     children: _buildTiles(),
            //   ),
            // )
          ],
        ),
      ),
    );
  }

  List<Widget> _buildTiles() {
    List<Widget> tiles = [];
    for (ChooseCollege college in _collegeSuggestions) {
      tiles.add(ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
        minVerticalPadding: height * 0.05,
        leading: college.logo != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: Image.memory(college.logo!))
            : Image.asset('assets/no_profile_icon.png'),
        title: Text(college.name),
        onTap: () {
          Navigator.pop(context, college);
        },
      ));
    }
    return tiles;
  }
}
