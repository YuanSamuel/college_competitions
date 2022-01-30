import 'dart:io';

import 'package:college_competitions/models/User.dart';
import 'package:college_competitions/services/firebase_service.dart';
import 'package:college_competitions/services/pick_image_service.dart';
import 'package:college_competitions/utils/string_constants.dart';
import 'package:college_competitions/widgets/pick_college_modal.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/dropdown/gf_multiselect.dart';

class SetUpProfileScreen extends StatefulWidget {
  const SetUpProfileScreen(
      {Key? key,
      required this.name,
      required this.phoneNumber,
      required this.email})
      : super(key: key);

  final String name;
  final String phoneNumber;
  final String email;

  @override
  _SetUpProfileScreenState createState() => _SetUpProfileScreenState();
}

class _SetUpProfileScreenState extends State<SetUpProfileScreen> {
  File? _profilePicture;
  String _college = '';
  List<String> _interests = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () async {
              _profilePicture = await PickImageService().pickImage(context) ??
                  _profilePicture;

              setState(() {});
            },
            child: CircleAvatar(
              foregroundImage: _profilePicture != null
                  ? Image.file(_profilePicture!).image
                  : const AssetImage('assets/no_profile_icon.png'),
              radius: 30.0,
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              _college = await showModalBottomSheet<String>(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) {
                        return const PickCollegeModal();
                      }) ??
                  _college;

              setState(() {});
            },
            child: Text('Choose College'),
          ),
          GFMultiSelect(
            items: StringConstants.interests,
            onSelect: (List<dynamic> interests) {
              _interests = List<String>.from(interests);
              setState(() {});
            },
          ),
          ElevatedButton(
              onPressed: () async {
                String profileUrl = '';
                if (_profilePicture != null) {
                  profileUrl = await FirebaseService()
                      .uploadProfilePicture(_profilePicture!);
                }

                User user = User(widget.name, _college, widget.email,
                    widget.phoneNumber, profileUrl, 0, _interests);

                await FirebaseService().createUser(user);

                int count = 0;
                Navigator.popUntil(context, (route) => count++ == 2);
              },
              child: const Text('Complete'))
        ],
      ),
    );
  }
}
