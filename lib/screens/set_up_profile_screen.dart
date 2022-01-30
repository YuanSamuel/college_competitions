import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:college_competitions/models/ChooseCollege.dart';
import 'package:college_competitions/models/User.dart';
import 'package:college_competitions/services/firebase_service.dart';
import 'package:college_competitions/services/pick_image_service.dart';
import 'package:college_competitions/utils/string_constants.dart';
import 'package:college_competitions/utils/style_constants.dart';
import 'package:college_competitions/widgets/pick_college_modal.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/dropdown/gf_multiselect.dart';
import 'package:getwidget/getwidget.dart';
import 'package:getwidget/types/gf_checkbox_type.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/chip_field/multi_select_chip_field.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';

class SetUpProfileScreen extends StatefulWidget {
  const SetUpProfileScreen(
      {Key? key,
      required this.name,
      required this.phoneNumber,
      required this.email,
      required this.password})
      : super(key: key);

  final String name;
  final String phoneNumber;
  final String email;
  final String password;

  @override
  _SetUpProfileScreenState createState() => _SetUpProfileScreenState();
}

class _SetUpProfileScreenState extends State<SetUpProfileScreen> {
  File? _profilePicture;
  ChooseCollege? _chooseCollege;
  List<String> _interests = [];

  @override
  Widget build(BuildContext context) {
    double width = StyleConstants.width;
    double height = StyleConstants.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: height * 2.0,
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
                            'Account Information',
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
                height: height * 1.8,
                width: width,
                color: StyleConstants.darkBlue,
                child: Container(
                  height: height * 1.8,
                  width: width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(40.0)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                    child: Column(
                      children: [
                        SizedBox(
                          height: height * 0.05,
                        ),
                        GestureDetector(
                          onTap: () async {
                            _profilePicture =
                                await PickImageService().pickImage(context) ??
                                    _profilePicture;

                            setState(() {});
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            foregroundImage: _profilePicture != null
                                ? Image.file(_profilePicture!).image
                                : const AssetImage('assets/no_profile_icon.png'),
                            radius: 30.0,
                          ),
                        ),
                        Text(
                          'Profile Pic',
                          style: StyleConstants.subTextReg,
                        ),
                        SizedBox(
                          height: height * 0.05,
                        ),
                        GestureDetector(
                          onTap: () async {
                            _chooseCollege =
                                await showModalBottomSheet<ChooseCollege>(

                                        context: context,
                                        isScrollControlled: true,
                                        builder: (context) {
                                          return const PickCollegeModal();
                                        }) ??
                                    _chooseCollege;
                            setState(() {});
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
                                'Choose College',
                                style: StyleConstants.medTextBold
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        _chooseCollege == null
                            ? SizedBox.shrink()
                            : Text(
                                _chooseCollege!.name,
                                style: StyleConstants.subTextReg,
                              ),
                        SizedBox(
                          height: height * 0.05,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Select Interests',
                            style: StyleConstants.medTextReg,
                          ),
                        ),
                        GFMultiSelect(
                          items: StringConstants.interests,
                          // items: ['poop', 'dshit', ],
                          onSelect: (List<dynamic> interests) {
                            _interests = [];
                            for (int i = 0; i < interests.length; i++) {
                              _interests
                                  .add(StringConstants.interests[interests[i]]);
                            }

                            setState(() {});
                          },

                          dropdownTitleTileTextStyle:
                          const TextStyle(fontSize: 14, color: Colors.black54),
                          padding: const EdgeInsets.all(6),
                          margin: const EdgeInsets.all(6),
                          type: GFCheckboxType.basic,
                          activeBgColor: StyleConstants.lightBlue,
                          activeBorderColor: StyleConstants.lightBlue,
                          inactiveBorderColor: Colors.grey.shade200,
                          size: GFSize.MEDIUM,
                        ),
                        SizedBox(
                          height: height * 0.05,
                        ),
                        GestureDetector(
                          onTap: () async {
                            bool works = await FirebaseService()
                                .signUp(widget.email, widget.password);

                            if (works && _chooseCollege != null) {
                              String profileUrl = '';
                              if (_profilePicture != null) {
                                profileUrl = await FirebaseService()
                                    .uploadProfilePicture(_profilePicture!);
                              }

                              User user = User(
                                  widget.name,
                                  _chooseCollege!.name,
                                  widget.email,
                                  widget.phoneNumber,
                                  profileUrl,
                                  0,
                                  _interests);

                              await FirebaseService().createUser(user);
                              await FirebaseService()
                                  .updateCollege(_chooseCollege!);
                              int count = 0;
                              Navigator.popUntil(context, (route) => count++ == 2);
                            } else {
                              print('cannot make account');
                            }
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
