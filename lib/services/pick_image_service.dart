import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickImageService {
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
                children: const [
                  Icon(Icons.camera_alt_outlined),
                  Text('Camera'),
                ],
              ),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, ImageSource.gallery);
              },
              child: Row(
                children: const [
                  Icon(Icons.collections_outlined),
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
