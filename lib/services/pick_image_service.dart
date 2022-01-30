import 'dart:io';

import 'package:college_competitions/utils/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickImageService {
  double width = StyleConstants.width;
  double height = StyleConstants.height;

  Future<File?> pickImage(BuildContext context) async {
    ImageSource? source = await showDialog<ImageSource>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Choose Image From:'),
          children: [
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, ImageSource.camera);
              },
              child: Row(
                children: [
                  Icon(Icons.camera_alt_outlined),
                  SizedBox(width: width * 0.05,),
                  Text('Camera'),
                ],
              ),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, ImageSource.gallery);
              },
              child: Row(
                children:  [
                  Icon(Icons.collections_outlined),
                  SizedBox(width: width * 0.05,),
                  Text('Gallery'),
                ],
              ),
            )
          ],
        );
      },
    );

    if (source != null) {
      XFile? file =
          await ImagePicker().pickImage(source: source, imageQuality: 60);
      if (file != null) {
        return File(file.path);
      } else {
        return null;
      }
    } else {
      return null;
    }
  }
}
