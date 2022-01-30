import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StyleConstants {
  static MediaQueryData? _mediaQueryData;

  //for iPhone SE2 - 647.0 and 375.0
  static double height = 0;
  static double width = 0;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    height = _mediaQueryData!.size.height -
        (_mediaQueryData!.padding.top + _mediaQueryData!.padding.bottom);
    width = _mediaQueryData!.size.width -
        (_mediaQueryData!.padding.left + _mediaQueryData!.padding.right);

    print('height: ' + height.toString() + ' width: ' + width.toString());
  }

  //colors
  static Color darkWhite = const Color(0xffF7F8FC);

  static Color lightBlack = const Color(0xff575B5F);

  static Color lightGrey = const Color(0xffF7F8FC);

  static Color lightBlue = const Color(0xff9FD7FF);

  static Color darkBlue = const Color(0xff234E6F);

  static TextStyle titleTextReg = TextStyle(fontSize: 30.0, fontWeight: FontWeight.normal, color: darkBlue);

  static TextStyle titleTextBold = TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: darkBlue);

  static TextStyle medTextReg = TextStyle(fontSize: 20.0, fontWeight: FontWeight.normal, color: darkBlue);

  static TextStyle medTextBold = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: darkBlue);

  static TextStyle descTextReg = TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal, color: darkBlue);

  static TextStyle subTextReg = TextStyle(fontSize: 15.0, fontWeight: FontWeight.w400, color: darkBlue);

  static TextStyle subTextBold = TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: darkBlue);





}