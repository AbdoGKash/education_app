import 'package:education_app/core/resources/color_manager.dart';
import 'package:flutter/material.dart';

import 'values_manager.dart';

class TextStyleManger {
  static TextStyle headLineLarge() {
    return TextStyle(
        color: ColorManager.primary2,
        fontSize: FontSize.s22,
        fontWeight: FontWeight.bold);
  }

  static TextStyle bodySmall() {
    return TextStyle(color: ColorManager.primary2);
  }

  static TextStyle headLineMedium() {
    return TextStyle(color: ColorManager.white, fontSize: FontSize.s16);
  }

  static TextStyle bodyLarge() {
    return TextStyle(
        color: ColorManager.error,
        fontSize: FontSize.s22,
        fontWeight: FontWeight.bold);
  }

  static TextStyle labelSmall() {
    return TextStyle(color: ColorManager.primary, fontSize: FontSize.s12);
  }

  static TextStyle titleSmall() {
    return TextStyle(
        color: ColorManager.white,
        fontSize: FontSize.s16,
        fontWeight: FontWeight.bold);
  }
}

//=============================   AppBar  =============================

class AppBarManger {
  static AppBar appBarManger(String name) {
    return AppBar(
      centerTitle: true,
      backgroundColor: ColorManager.primary2,
      titleTextStyle: TextStyleManger.headLineMedium(),
      title: Text(name),
      foregroundColor: ColorManager.white,
    );
  }
}
